
#  TPS Sdk - IOS Guide

The TPS SDK is for interacting with the TPS platform to add, update or remove vehicles for integrated Ticketless Parking System. It provides functionality to ticketless parking experiment.

In order to use SDK framework you must be a registered developer with a provisioned token.

## Requirements
* SDK Supports min IOS 11 or newer Deployment Target.
* TokenProvider Protocol must be implemented for Authentication Token: Provided by TPS Development Team.

## Integration 

To install the TPS SDK directly into your application, open your project and open the project navigator (**⌘ + 0**) > Tap on **Your Project** > Under **Targets**, click on the selected **Build Target** > Tap on the **General** tab, located at the top > Drag the TpsSdk.framework into the **Embedded Frameworks** section. The TpsSdk.framework should appear in both the Embedded Frameworks and Linked Libraries and Frameworks section.

## Required Libraries

TPS Sdk dependent a couple of another framework. Please make sure you have;
 
 Moya.framework\
 Result.framework\
 RxCocoa.framework\
 RxMoya.framework\
 Alamofire.framework

inside the Embedded Frameworks section

#### CocoaPods 

If you are using CocoaPods enough to import Rx version to Moya library;

```
pod 'Moya/RxSwift', '~> 11.0'
```

and call your project path pod install, Don’t forget to use the workspace .xcworkspace file, not the project .xcodeproj file.

#### Carthage
Import Moya library is enough to add your Cartfile

```
github "Moya/Moya"
```
And call your project path;

```
carthage update --platform iOS --verbose
```

# SDK Overview

## Initialize and Start Sdk
 Use TPSSdk framework, import TPSSdk first, and then call TPSSdk's *start* function.


```swift
 let environment = TpsEnvironment.sharedInstance.selectEnvironment(.staging)
 let builder = TpsBuilder(environment: environment, tokenProvider: self)
 TpsSdk.shared.start(builder: builder)
 ```

## Tps protocol

* All sdk functions using Tps protocol. It's a simple interface to access functionalities of Tps SDK. You can call these functions via TpsSdkManager's singleton.

```swift
/**
     Start the Tps for initial logic
     
     - Important: Don't forget the implementation TokenProvider protocol for your valid access which is given by the Tps.
     
     - Parameters:
     - TpsBuilder: Builder includes TokenProvider and TpsEnvironment
     
     // Sample Implementation
     let environment = TpsEnvironment.sharedInstance.selectEnvironment(.staging)
     let builder = TpsBuilder(environment: environment, tokenProvider: self)
     TpsSdk.shared.start(builder: builder)
     
     */
    func start(builder :TpsBuilder)
    
    /**
     Get all your registered vehicles
     
     - Important: User's id needed
     
     - Parameters:
        - handler: Use that Tps Handler for result
            - `vehicles`: Gives the all registered vehicles
            - `error`: Gives error object that includes error logic
     
     - throws: `TpsError.someError`
        - An error of type `TpsError`
     
     */
    func getRegisteredVehicles( handler: @escaping TpsVehiclesHandler )

/**
     Add your vehicle for your vehicle management
     
     - Parameter vehicle: Your vehicle will be added
     - Parameter handler: Tps Handler that you can use your for result
        - `vehicles`: Gives the all registered vehicles
        - `error`: Gives error object that includes error logic
     
     - throws: `TpsError.someError`
        - An error of type `TpsError`

     */
    func add( vehicle: VehicleModel, handler: @escaping TpsVehicleManagementHandler )
    
    /**
     Remove your vehicle for your vehicle management
     
     - Parameter vehicle: Your vehicle will be removed
     - Parameter handler: Tps Handler that you can use your for result
     - `error`: Gives error object that includes error logic
     
     - throws: `TpsError.someError`
        - An error of type `TpsError`

     */
    func remove( vehicle: VehicleModel, handler: @escaping (_ error: NSError?) -> Void )
    
    /**
     Update your vehicle for your vehicle management
     
     - Parameter vehicle: Pass your updated vehicle
     - Parameter handler: Tps Handler that you can use your for result
     - Handler Parameter: `vehicles`: Gives the all registered vehicles
     - Handler Parameter: `error`: Gives error object that includes error logic
     
     - throws: `TpsError.someError`
        - An error of type `TpsError`

     */
    func update( vehicle: VehicleModel, handler: @escaping TpsVehicleManagementHandler )

    func getTransactionHistoryForVehicle(vehicle : VehicleModel,page : Int , perPage : Int,handler : @escaping TpsTransactionHandler)

    func getTransactionHistory(page : Int , perPage : Int,handler : @escaping TpsTransactionHandler)


```
## Models

### Vehicle
```swift
/// Vehicle for the Tps
@objc public class VehicleModel : NSObject {

    /// Vehicle id for need valid interactions
    @objc public var vehicleId: Int
    
    /// Vehicles plate
    @objc public var plateModel: PlateModel?

    /// Card uuid for payment process
    @objc public var creditCardId: String

    /// Vehicle rental status
    @objc public var isRental: Bool
    
    /// Rental vehicle validation start date
    @objc public var validFrom: NSNumber?

    /// Rental vehicle validation end date
    @objc public var validTo: NSNumber?

}

```

### Plate
```swift
/// Vehicle for the Tps
@objc public class PlateModel : NSObject {

    @objc public var code: String
    
    @objc public var source: String

    @objc public var country: String?

    @objc public var number: String
    
    /// Whole plate number 
    @objc public var plate: String { get }
}

```

## Version
* 1.0
