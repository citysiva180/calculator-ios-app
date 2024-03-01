//
//  ContentView.swift
//  calculator
//
//  Created by Sivarajan on 01/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var operation:String = ""
    @State private var result: String = ""
    var body: some View {
        VStack(spacing:20){
            
            CustomTextView(title:"First Number",text:$firstNumber) // This is the important prop which actually brings the value from -reusable component
            
            let calculator = Calculator()
            
            
            Picker("Picker",selection:$operation){
                Text("+").tag("+")
                Text("-").tag("-")
                Text("*").tag("*")
                Text("/").tag("/")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            CustomTextView(title:"Second Number",text:$secondNumber)
            
            Text(result)
                .font(.title)
                .foregroundColor(.mint)
            
            Button{
                self.result = calculator.calculate(firstNumber: firstNumber, secondNumber: secondNumber,operation:operation)
            } label: {
                Text("Calculate")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            
            
        }
    }
    
}

class Calculator{
    func calculate(firstNumber:String, secondNumber:String, operation:String)-> String{
        let num1 = Int(firstNumber)  ?? 0// Type casting | Optional is a special datatype which helps in writing safe cases
        let num2 = Int(secondNumber) ?? 0// Using the ?? helps in giving out default value to the numbers
        
        switch operation {
            case "+":
                return String(num1 + num2)
            case "-":
                return String(num1 - num2)
            case "*":
                return String(num1 * num2)
            case "/":
                return String(num1 / num2)
            default:
                return "Invalid"
        }
    }
}

