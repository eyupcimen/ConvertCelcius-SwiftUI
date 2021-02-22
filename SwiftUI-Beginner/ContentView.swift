//
//  ContentView.swift
//  SwiftUI-Beginner
//
//  Created by eyup cimen on 13.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue : String = ""

    let numberFormatter : NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelcius () -> String {
        if let value = Double(fahrenheitValue) {
            let fahrenheit = Measurement<UnitTemperature>(value: Double(value) , unit: .fahrenheit)
            let celciusValue = fahrenheit.converted(to: .celsius)
            let formattedCelciusValue = numberFormatter.string(from: NSNumber(value: celciusValue.value) )
            return formattedCelciusValue ?? "???"
        } else {
            return "???"
        }
    }
  
    var body: some View {
        VStack{
            
            TextField("value", text: $fahrenheitValue)
                .font(Font.system(size: 80.0))
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("fahrenheit")
            Text("is actually")
                .foregroundColor(.gray)
            Text(convertToCelcius())
                .font(Font.system(size: 64.0))
            Text("degress Celcius")
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}






