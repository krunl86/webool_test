# webool

This is application for listing currency list from open api. this project is only for interview preparation

# Tasks

In this perticular Interview task I have done Functionality like

- Fetching Currency List from https://apilayer.com/
- Getting Currency Rate from https://apilayer.com/
- Adding Multiple Currency With amount to get total Value in base currency
- Filtering/Sorting Currency List 
- Used Riverpod for state management with MVVM architecture
- Responsive UI for both Potrait and LandScape Mode (managed separate UI for both orientation)
- Added Centralized Mechanism to manage Logs,Errors,Toast Msg, Success Msg, Failer Msg etc using Masage Manager Utility




# How to Add New Currency ?

To Perform this action user has to tap on Add Curency Button On Dashboard

- New Item Will be added in List Where user has option to change Currency and can add amount he want to compare 

- User can change currency from drop down field, user also can search with in list view. for this have used 3rd party package due to time constraint


# How to Change Base Curerncy ?

To Perform this action user hase to tap on setting icon

- here user can search currency based on country name and just have to tap on Tile to make it selected.
  Newly selected base currency will be highlited
  

# Video Link Of App Recording

https://youtu.be/NOONaqMayd0

# Project Setup

- I have used project setup for MVVM structure. along with use of riverpod.
- Have feature sentric approch for folder structure. where all new feature have their separate MVP folder structure.
- As of now we have only one screen cum feature of CryptoList so folder structure is simple

# Exra Information

- I have created separate packages for internationlization for common use for centralized language support for multiple sub app
- I have created network request separte from main app to provide same apis for other or sub apps if any we include in feature
- I have made common widgets as well for separate package along with theme data and AssetManagement for icons and common images.
- Also for routing management i have integrated GoROuter but have not done much user in this demo app as i have only one page to work on.

# In Last

- do let me know your feedback for this setup. love to hear from expert to evoluate my knowledge an understanding
