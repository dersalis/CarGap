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
    
    var tankCapacity1: String = ""
    var fuelType1: Int = 0
    var fuelUnit1: Int = 0
    var combustionUnit1: Int = 0
    
    var isSecondTank: Bool = false
    
    var tankCapacity2: String = ""
    var fuelType2: Int = 0
    var fuelUnit2: Int = 0
    var combustionUnit2: Int = 0
    
    var photo: Data?
    var year: Date?
    var vin: String = ""
    var insurande: String = ""
    var insurandeDate: Date?
}

