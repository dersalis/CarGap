//
//  CarController.swift
//  CarGap
//
//  Created by Damian Ruta on 01/12/2022.
//

import Foundation
import CoreData

class CarController: ObservableObject {
    let container = NSPersistentContainer(name: "CarGapModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved.")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addCar(newCar: AddCar, context: NSManagedObjectContext) {
        let car: Car = Car(context: context)
        car.id = UUID()
        car.name = newCar.name
        car.mark = newCar.mark
        car.model = newCar.model
        car.registrationNo = newCar.registrationNo
        car.tankCapacity1 = newCar.tankCapacity1
        car.fuelType1 = newCar.fuelType1
        car.fuelUnit1 = newCar.fuelUnit1
        car.combustionUnit1 = newCar.combustionUnit1
        car.isSecondTank = newCar.isSecondTank
        car.tankCapacity2 = newCar.tankCapacity2
        car.fuelType2 = newCar.fuelType2
        car.fuelUnit2 = newCar.fuelUnit2
        car.combustionUnit2 = newCar.combustionUnit2
        car.photo = newCar.photo
        car.year = newCar.year
        car.vin = newCar.vin
        car.insurance = newCar.insurande
        car.insuranceDate = newCar.insurandeDate
        
        car.modificationDate = Date()
        
        save(context: context)
    }
    
}
