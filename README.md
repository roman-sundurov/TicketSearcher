I've created an iOS app from scratch called TicketSearcher, which is a price aggregator for plane and hotel tickets. It was developed as a test task for one of the IT companies to assess my iOS development skills. My main objectives were to create the first tab screen to display air ticket prices and other screens to prepare for later development. The company provided the Figma layouts.

The TestFlight link: [https://testflight.apple.com/join/06boDdpv](https://testflight.apple.com/join/06boDdpv).

## Stack
- Language: Swift
- Interface: SwiftUI
- Architecture: MVVM + Coordinator
- Package dependencies: SPM
- Frameworks: ﻿Combine, Alamofire, SwiftLint
- CI/CD: Xcode Cloud
- Other: Git-Flow, RESTful API

## Features
- The minimal deployment version is iOS 16.0.
- The application uses three different API calls:
  - https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd
  - https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017
  - https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf

## Note
- The requirements for the test did not specify that all elements had to be clickable and functional.
- I based my work on the mockups provided in Figma, so I followed the given design and didn't have any influence on it.
- The test task required creating an application with Russian localization. I plan to add English localization for English-speaking reviewers later.
- The approximate time it took to complete the task was 25 work hours.

## AirTicket starter screens & Country search sheet
<center>
<img src="https://github.com/roman-sundurov/TicketSearcher/assets/68818066/2b654843-48ba-4245-81bc-7c57888a20c6" alt="RocketSim_Screenshot_iPhone_15_Pro_6 1_2024-06-08_05 55 29" width="320px">
<img src="https://github.com/roman-sundurov/TicketSearcher/assets/68818066/01940156-b500-418b-a774-1679867639da" alt="RocketSim_Screenshot_iPhone_15_Pro_6 1_2024-06-08_05 55 34" width="320px">

## Tickets detail screens
<img src="https://github.com/roman-sundurov/TicketSearcher/assets/68818066/08eb52d1-9490-4da9-a3c6-ef617c44677f" alt="RocketSim_Screenshot_iPhone_15_Pro_6 1_2024-06-08_05 56 02" width="320px">
<img src="https://github.com/roman-sundurov/TicketSearcher/assets/68818066/75faac13-5a09-4cb9-a829-51703b2db661" alt="RocketSim_Screenshot_iPhone_15_Pro_6 1_2024-06-08_05 55 57" width="320px">
<img src="https://github.com/roman-sundurov/TicketSearcher/assets/68818066/4b5c815b-dd06-4cf3-ae6d-88e9aa1de902" alt="RocketSim_Screenshot_iPhone_15_Pro_6 1_2024-06-08_05 56 02" width="320px">
