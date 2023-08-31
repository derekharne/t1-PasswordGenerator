//
//  PwdGenApp.swift
//  t1-PasswordGenerator
//
//  Created by Derek Harne on 8/31/23.
//

import Foundation

class PwdGenApp: ObservableObject {
    @Published var generatedPassword = "Swift Password Generator"
    
    func generatePassword(length: Int, useSymbols: Bool, useNumbers: Bool) {
        var characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        if useSymbols == true {
            characters = characters + "!@#$%^&*()-="
        }
        if useNumbers == true {
            characters = characters + "1234567890"
        }
        
        generatedPassword = (0..<length).map{_ in String(characters.randomElement()!)}.reduce("", +)
    }
}
