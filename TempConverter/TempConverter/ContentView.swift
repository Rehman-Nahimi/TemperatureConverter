//
//  ContentView.swift
//  TempConverter
//
//  Created by Ray Nahimi on 31/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var intialValue = 0.0
    @State private var finalVaue = 0.0
    @State private var firstTemp = "Celsius"
    @State private var finalTemp = "Celsius"
    let tempUnits = ["Celsius", "Farenheit", "Kelvin"]
    var finalNumber: Double{
        let firstValue = intialValue
        var calculation = 0.0
        if firstTemp == "Celsius" && finalTemp == "Kelvin"{
            calculation = firstValue + 273
        } else if firstTemp == "Celsius" && finalTemp == "Farenheit"{
            calculation = firstValue * (9/5) + 32
        } else if firstTemp == "Farenheit" && finalTemp == "Celsius"{
            calculation = (5/9) * (firstValue-32)
        } else if firstTemp  == "Farenheit" && finalTemp == "Kelvin"{
            calculation = (5/9) * (firstValue-32) + 273
        } else if firstTemp == "Kelvin" && finalTemp == "Celsius"{
            calculation = firstValue - 273
        } else if firstTemp == "Kelvin" && finalTemp == "Farenheit"{
            calculation = (firstValue - 273) * (9/5) + 32
        }
        else {
            calculation = firstValue
        }
            
            
        return calculation
    }
        
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Degree", value: $intialValue, format: .number)
                    
                }
                Section{
                    Picker("Temperature", selection:$firstTemp){
                        ForEach(tempUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(finalNumber, format: .number)
                }
                Section{
                    Picker("Temperature", selection:$finalTemp){
                        ForEach(tempUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
