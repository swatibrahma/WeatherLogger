# WeatherLogger

This application is used for saveing weather conditions for your current location.

## Prerequisite

- This app requires Mac OS Catalina (10.15.7) or higher
- Minimum Xcode 11.3.1 required

## Getting Started :

- Clone this project
- Run WeatherLogger.xcodeproj
- This app supports iPhone & iPad.

## Implementation Details

Below are list of Packages and responsibilities of each packages :

- BackEnd - This package contains code base of service handling & Core Data manager.
- FronEnd - This package contains code base of view and its business logic.
- Resources - This package holds all resources of application like Assets, Localization file etc.
- Model - This package holds all data models of application.
- Utility - This package holds utilities like DateUtility etc.
- WeatherLoggerTests - This package contains all unit test cases of application
- WeatherLoggerUITests - This package contains UI test cases of application
- Used VIPER design pattern.
 
 Service Classes :

 ServiceManager - This class is responsible to talk with URLSession using respective tasks.
 ServiceConstants - This class contains all constants related to service.
 WeatherServiceManager - This class is responsible for calling  api for getting video details.
 
 Views :

WeatherLoggerViewController - This is main view controller which shows data from the location api.
WeatherDetailsViewController - This is for showing saved weather details.
WeatherDetailTableCell - This contains custon table cell.

View Models : 
WeatherViewModel - For showing required data on screen.

Models : 
WeatherModel - Request Model.
WeatherResponseModel - Response model.
WeatherLog - Core Data Entity.




