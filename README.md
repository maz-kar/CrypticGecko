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

## Networking Layers:
1. NetworkingManager in Utilities
2. DataService in Services
3. ViewModel


## TODO
Add UnitTests for all the VMs
Add UITests for all the Views

On 25.07: 
- Rework on CoinImageServiceTest class.
- Rewrite the LocalFileManager and make a separated repo in the end out of it.

