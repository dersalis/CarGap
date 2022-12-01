//
//  AddCar.swift
//  CarGap
//
//  Created by Damian Ruta on 30/11/2022.
//

import Foundation

struct AddCar {
    var name: String = ""
    var mark: String = ""
    var model: String = ""
    var registrationNo: String = ""
    var description: String = ""
    
    var tankCapacity1: Int16 = 0
    var fuelType1: Int16 = 0
    var fuelUnit1: Int16 = 0
    var combustionUnit1: Int16 = 0
    
    var isSecondTank: Bool = false
    
    var tankCapacity2: Int16 = 0
    var fuelType2: Int16 = 0
    var fuelUnit2: Int16 = 0
    var combustionUnit2: Int16 = 0
    
    var photo: Data?
    var year: Date = Date()
    var vin: String = ""
    var insurande: String = ""
    var insurandeDate: Date = Date()
}

