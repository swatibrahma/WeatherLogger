# WeatherLogger

This application is used for viewing & saving weather conditions for your current location.

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


Sample UI:

![Screenshot 2021-02-28 at 12 09 25 AM](https://user-images.githubusercontent.com/28644576/109419927-ea501f80-79f5-11eb-91b8-67db2a223b2a.png)

![Screenshot 2021-02-28 at 12 09 42 AM](https://user-images.githubusercontent.com/28644576/109419940-f5a34b00-79f5-11eb-97f2-394893347626.png)

![Screenshot 2021-02-28 at 12 09 56 AM](https://user-images.githubusercontent.com/28644576/109419951-00f67680-79f6-11eb-9360-cf8def3fb939.png)

![Screenshot 2021-03-01 at 12 50 42 PM](https://user-images.githubusercontent.com/28644576/109464450-b07e2800-7a8c-11eb-890c-8fba5b2aad6a.png)



