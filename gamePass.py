#!/usr/bin/python
import sys
import os
from distutils.dir_util import copy_tree
import fileinput
import time
#make a new directory if the new Directory isn't yet made
newDirPath = os.getcwd() +'/new'
mainAssets = newDirPath + '/assets'
mainJs = newDirPath + '/js'
if not os.path.exists(newDirPath):
	#make the new directory that contains our game followed by its sub directories for assets, js and pages
	os.makedirs(newDirPath)
	os.makedirs(mainAssets)
	os.makedirs(mainJs)

currentDirectory = os.getcwd();
directoryFiles = os.listdir(currentDirectory)
#gets title on my local machine in test directory// comment out for use in main directory
title = currentDirectory.replace('/Users/benc/git/phaser/public_html/assets/phaser/', '')
#gets titel on my local machine in real directory //uncomment for production
#title = currentDirectory.replace('/Users/benc/git/schoolzone/phaser/public_html/assets/phaser')
title = title.replace('-', ' ')
print title
currentVersion = ''
for i in directoryFiles:
	currentVersion = i
	#get the files in the root directory of the old version, this will be 1.0.0, 1.0.1 etc, ignore  .dstore
	if i[0] == '1':
		#make new versions in the main-js directory to hold the javascript
		newJsDir = mainJs + '/' + i
		os.makedirs(newJsDir)

		#make new versions in the main-assets directory to hold the asset folders
		newAssetsDir = mainAssets + '/' + i
		os.makedirs(newAssetsDir);

		#get the asset path of the old directories
		assetPath = currentDirectory + '/' + i +'/assets'
		jsPath =  currentDirectory + '/' + i +'/js'
		
		#copy the files to their new home
		copy_tree(jsPath, newJsDir)
		copy_tree(assetPath, newAssetsDir)

		#used to hold the assetSize
		assetSize = ''
		orientation = ''

		#we have two for loops for boot because we need data that is held in the bottom of the file at the top
		for line in fileinput.input(newJsDir + '/Boot.js', inplace = True):
			print line.rstrip().replace(i +'/assets', 'assets/' + i)
			if 'szPhaserPreload' in line:
				assetsize = line[17:22]
			if 'szPhaserPreload' in line and 'true' in line:
				orientation = 'true'
			else:
				orientation = 'false'

		for line in fileinput.input(newJsDir + '/Boot.js', inplace = True):

			if 'var assetRoot =' in line:
				print line.rstrip().replace('var assetRoot =', 'var cdn = szPhaserCDN();\n\nvar assetRoot =')
				print 'var activityData = {'
				print '"assetSize" : "' + assetsize + '",'
				print '"forceOrientation" : "' + orientation + '",'
				print '"title" : "' + title + '",'
				print '"version" : "' + i + '",'
				print '"date" : "' + time.strftime("%m/%d/%y") +'",'
				print '}'
			else:
				print line.rstrip()
		

		for line in fileinput.input(newJsDir + '/Game.js', inplace = True):
			noMusicButton = 'toggleMusic' not in line or 'Selected:' in line or 'play(' in line
			noExitButton = 'exit' not in line or 'Selected:' in line or 'play(' in line
			noHelpButton = 'help' not in line or 'Selected:' in line or 'play(' in line
			if noMusicButton and noExitButton and noHelpButton:
				print line.rstrip()

