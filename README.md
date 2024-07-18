# CrypticGecko

## Description
A self-educational iOS app to track coin prices.

## APIs
https://www.coingecko.com/en/api

## Frameworks
Swift - SwiftUI - Combine -> ...

## Architecture
MVVM

## Instructions
1. Customised color themes and app icon were added to the Assets of the project.
2. A reusable button was created to be used for the header of the home screen.
3. MVVM files of "Home" screen were added to the project.
//Add the prior steps

## Services
1. CoinDataService: 
2. CoinImageService: To firstly download and save images in Filemanager and afterwards to retrieve the saved images.

## TODO
1. Complete the LocalFileManager connections
2. Refactor the CoinImageService with getImage & saveImage of LocalFileManager
3. Add UnitTests for all the VMs
4. Add UITests for all the Views

On 19.07: 
create:
test Service class for getting data
test Utility class for downloading data + handling responses + handling completions + enum for errors
