//
//  ContentView.swift
//  t1-PasswordGenerator
//
//  Created by Derek Harne on 8/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pwdGenApp = PwdGenApp()
    
    @State private var passwordLength = 16.0
    @State private var useSymbols = false
    @State private var useNumbers = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                //Generated Password Text
                if pwdGenApp.generatedPassword.count < 20 {
                    Text("\(pwdGenApp.generatedPassword)")
                        .bold()
                        .font(.system(size: 36))
                        .foregroundColor(.blue)
                        .textSelection(.enabled)
                }
                if pwdGenApp.generatedPassword.count > 19 && pwdGenApp.generatedPassword.count < 29 {
                    Text("\(pwdGenApp.generatedPassword)")
                        .bold()
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                        .textSelection(.enabled)
                }
                if pwdGenApp.generatedPassword.count > 28 {
                    Text("\(pwdGenApp.generatedPassword)")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                        .textSelection(.enabled)
                }
                //Options
                HStack {
                    Slider(
                            value: $passwordLength,
                            in: 8...30,
                            step: 1
                        ) {
                            Text("Password Length")
                        } minimumValueLabel: {
                            Text("8")
                        } maximumValueLabel: {
                            Text("30")
                        }
                        .padding()
                        .frame(width: 400)
                        let passwordLengthInt = Int(passwordLength)
                        Text("\(passwordLengthInt)")
                            .foregroundColor(.blue)
                }
                Toggle("Use Symbols", isOn: $useSymbols)
                    .toggleStyle(.checkbox)
                Toggle("Use Numbers", isOn: $useNumbers)
                    .toggleStyle(.checkbox)
                Button("Generate Password") {
                    pwdGenApp.generatePassword(length: Int(passwordLength), useSymbols: useSymbols, useNumbers: useNumbers)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
