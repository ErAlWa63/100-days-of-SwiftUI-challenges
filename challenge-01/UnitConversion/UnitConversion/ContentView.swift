//
//  ContentView.swift
//  UnitConversion
//
//  Created by Erik Waterham on 30/10/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tipInputTemperatureUnit = 2
    @State private var tipOutputTemperatureUnit = 1
    @State private var convertingTemperature = ""

    let temperatureUnit = ["K", "°C", "°F"]

    var convertedKelvinTemperature: Double {
        let temperature = Double(convertingTemperature) ?? 0
        switch tipInputTemperatureUnit {
        case 0:
            return temperature
        case 1:
            return temperature + 273.15
        case 2:
            return ((temperature - 32) / 9 * 5) + 273.15
        default:
            return 0
        }
    }

    var convertedTemperature: Double {
        switch tipOutputTemperatureUnit {
        case 0:
            return convertedKelvinTemperature
        case 1:
            return convertedKelvinTemperature - 273.15
        case 2:
            return ((convertedKelvinTemperature - 273.15) / 5 * 9) + 32
        default:
            return 0
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Temperature units")) {
                    Picker("Input unit type", selection: $tipInputTemperatureUnit) {
                        ForEach(0 ..< temperatureUnit.count) {
                            Text("\(self.temperatureUnit[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Picker("Output unit type", selection: $tipOutputTemperatureUnit) {
                        ForEach(0 ..< temperatureUnit.count) {
                            Text("\(self.temperatureUnit[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    TextField("Temperature \(temperatureUnit[tipInputTemperatureUnit])", text: $convertingTemperature)
                                            .keyboardType(.decimalPad)
                }
                Section {
                    Text("\(convertedTemperature, specifier: "%.2f") \(temperatureUnit[tipOutputTemperatureUnit])")
                }
            }
            .navigationBarTitle(Text("Unit Converter"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
