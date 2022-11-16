//
//  UIApplication.swift
//  CarGap
//
//  Created by Damian Ruta on 16/11/2022.
//

import Foundation
import UIKit

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
