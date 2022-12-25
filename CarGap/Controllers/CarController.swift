import Foundation
import CoreData

class BaseController {
    let container = NSPersistentContainer(name: "CarGapModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
//                fatalError("Core Data Store failed \(error.localizedDescription)")
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
}

class CarController: BaseController, ObservableObject {
    
    func count(){
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            try print("Cars count: \(container.viewContext.fetch(fetchRequest).count)")
        } catch {
            print("Faild test to get Cars. \(error)")
        }
    }
    
    func getAll() -> [Car] {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            print("Faild to get Cars. \(error)")
            return []
        }
    }
    
    func getById(id: UUID) -> Car? {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        do {
            return try container.viewContext.fetch(fetchRequest).first
        } catch {
            print("Faild to get Cars. \(error)")
            return nil
        }
    }
    
    func addCar(newCar: AddCar, context: NSManagedObjectContext) {
        
        let car: Car = Car(context: context)
        car.id = UUID()
        car.name = newCar.name
        car.mark = newCar.mark
        car.model = newCar.model
        car.registrationNo = newCar.registrationNo
        car.tankCapacity1 = Int16(newCar.tankCapacity1) ?? 0
        car.fuelType1 = Int16(newCar.fuelType1)
        car.fuelUnit1 = Int16(newCar.fuelUnit1)
        car.combustionUnit1 = Int16(newCar.combustionUnit1)
        car.isSecondTank = newCar.isSecondTank
        car.tankCapacity2 = Int16(newCar.tankCapacity2) ?? 0
        car.fuelType2 = Int16(newCar.fuelType2)
        car.fuelUnit2 = Int16(newCar.fuelUnit2)
        car.combustionUnit2 = Int16(newCar.combustionUnit2)
        car.photo = newCar.photo
        car.year = newCar.year
        car.vin = newCar.vin
        car.insurance = newCar.insurande
        car.insuranceDate = newCar.insurandeDate
        car.modificationDate = Date()
        
        save(context: context)
    }
    
    func add(newCar: AddCar) {
        let car: Car = Car(context: container.viewContext)
        car.id = UUID()
        car.name = newCar.name
        car.mark = newCar.mark
        car.model = newCar.model
        car.registrationNo = newCar.registrationNo
        car.tankCapacity1 = Int16(newCar.tankCapacity1) ?? 0
        car.fuelType1 = Int16(newCar.fuelType1)
        car.fuelUnit1 = Int16(newCar.fuelUnit1)
        car.combustionUnit1 = Int16(newCar.combustionUnit1)
        car.isSecondTank = newCar.isSecondTank
        car.tankCapacity2 = Int16(newCar.tankCapacity2) ?? 0
        car.fuelType2 = Int16(newCar.fuelType2)
        car.fuelUnit2 = Int16(newCar.fuelUnit2)
        car.combustionUnit2 = Int16(newCar.combustionUnit2)
        car.photo = newCar.photo
        car.year = newCar.year
        car.vin = newCar.vin
        car.insurance = newCar.insurande
        car.insuranceDate = newCar.insurandeDate
        car.modificationDate = Date()
        
        do {
            try container.viewContext.save()
        } catch {
            print("Failed to add Car. \(error)")
        }
    }
    
    func update() {
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            print("Failed to update Car. \(error)")
        }
    }
    
    func delete(car: Car) {
        container.viewContext.delete(car)
        
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            print("Faild to delete Car. \(error)")
        }
    }
}
