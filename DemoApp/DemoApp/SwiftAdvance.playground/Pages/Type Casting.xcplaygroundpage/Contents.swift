/*
 Name: Ankit Verma
 Topic: Type Casting
 */

class Vehicle {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}

class Car: Vehicle {
    var doors: Int = 4
    
    override init(wheels: Int = 4) {
        super.init(wheels: wheels)
    }
}

class Bike: Vehicle {
    override init(wheels: Int = 2) {
        super.init(wheels: wheels)
    }
}

enum ParkingLotError: Error {
    case noSpace
}

class ParkingLot {
    var capacity: Int
    var vehiclesInParkingLot: Int = 0
    var fee = 100
    
    init?(noOfAllowedVehicles capacity: Int) {
        guard capacity > 0 else {
            return nil
        }
        self.capacity = capacity
    }
    
    func park(vehicle: Vehicle) throws {
        if !canPark() {
            throw ParkingLotError.noSpace
        }
        if !(self is FreeParkingLot) {
            print("Charge fees $\(fee)")
        }
        switch vehicle {
        case is Car:
            print("Parking Car")
        case is Bike:
            print("Parking Bike")
        default:
            print("Parking Vehicle")
        }
        vehiclesInParkingLot += 1
    }
    
    func canPark() -> Bool {
        return vehiclesInParkingLot < capacity
    }
    
    func unPark(vehicle: Vehicle) {
        switch vehicle {
        case is Car:
            print("Unparking Car")
        case is Bike:
            print("Unparking Bike")
        default:
            print("Unparking Vehicle")
        }
        vehiclesInParkingLot -= 1
    }
}

class FreeParkingLot: ParkingLot {

}

let parkingLot = ParkingLot(noOfAllowedVehicles: 1) //pay fees to park
let freeParkingLot = FreeParkingLot(noOfAllowedVehicles: 1) //park without charge
let bullet = Bike()
let bugatti = Car()

if parkingLot == nil {
    print("There is no parking lot!\n")
}

func parkVehicles(parkingLot: ParkingLot?, _ vehicles: Vehicle...) {
    do {
        for vehicle in vehicles {
            try parkingLot?.park(vehicle: vehicle)
        }
    }
    catch ParkingLotError.noSpace  {
        print("Can't park because capacity is full!")
    }
    catch {
        print(error)
    }
}

print("Parking in Normal Parking Lot:")
parkVehicles(parkingLot: parkingLot, bullet, bugatti)
parkingLot?.unPark(vehicle: bullet)

print("\nParking in Free Parking Lot:")
parkVehicles(parkingLot: freeParkingLot, bullet)

print()
let vehicles = [bullet, bugatti]
vehicles.forEach { vehicle in
    switch vehicle {
    case let bike as Bike:
        print("Bike has \(bike.wheels) wheels!")
    case let car as Car:
        print("Car has \(car.wheels) wheels and \(car.doors) doors!")
    default:
        print("Vehicle has \(vehicle.wheels) wheels!")
    }
}
