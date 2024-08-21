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

## Networking Architecture:
To keep the app and its services reusable, I have used 3 layers:
1st Service, which is responsible for downloading from internet and after returning the data, appends the data to a published property.
2nd ViewModel, which is responsible for subscribing to the data appended to the published property of the Service.
3rd View, which is responsible for referencing to the ViewModel and at the end put the recevied data on screen.

## Utility classes:
1. NetworkingManager: This utility class consists of 3 static methods of download, handleCompletion and handleResponse. Plus an NetworkingError enum.
Being static func allows us to simply call like NetworkingManager.download every where in our app.
 
2. LocalFileManager: This utility class is used to SAVE images instead of redownloading them again and again. 
Therefore, the 2 main funcs inside of this class will be saveImages to the fileManger and getImages back from the fileManager.
Moreover, we will have 3 more funcs: getURLForFolder, getURLForImage, createFolderIfNeeded.

## Search & Filter by Combine:
The searchText published var in HomeViewModel will be binded to SearchBarView. Therefore, whenever we type something in the searchBar, this published var will be updated.
Hence, if we subscribe to this publisher, we can use its value.

We wanted to combine $searchText and $allCoins publishers and map them to a new array CoinsModel and also filter them.
 

## TODO
Add UnitTests for all the VMs
Add UITests for all the Views
Make a separated repo out of LocalFileManager.

On 22.08: 
- Finish StatisticModel


