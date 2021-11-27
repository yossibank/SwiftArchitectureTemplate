# SwiftArchitectureTemplate

## Environment
- Xcode: support for Xcode13 later
- iOS: support for iOS13 later

## Policy
- Simple
    - YAGNI
- Flexible
    - easy to change
- Communication
    - Naming and comment for clarity

## Setup
- remove comment out `FirebaseApp.configure()`
- put GoogleService-Info.plist on project root
- change app name
- `brew install swiftformat`

## Firebase
- [Google Analytics](https://firebase.google.com/docs/analytics) 
- [Firebase Crashlytics](https://firebase.google.com/docs/crashlytics)

## Configuration

### develop
- flag: DEBUG

### adhoc
- flag: ADHOC

### release
- flag: RELEASE

## Architecture

### Presentation
- ViewController: view logic of screen
    - Routing: transition (if no transition, use NoRouting)
    - ViewModel: data logic of screen (if no data logic, use NoViewModel) 
    - UserInterface: view component (if no view component, use NoUserInterface)

### Domain
- Usecase: Actions that cause an interaction between the user and the software
    - Repository: Accessing Data Sources
    - Mapper: Map response to entity

### Data
- Repository: components that encapsulate the logic required to access the data source
    - APIClient: remote API
    - PersistedDataHolder: UserDefault, File
    - SecretDataHolder: KeyChain
    - Others: 

## Utility Package
- include common functions for each project or package
- don't include UIKit

## Test
- Presentation: ViewModel
- Domain: Usecase, Mapper
- Data: Repository (decode response and side effect)
- Others: Utility, and so on
