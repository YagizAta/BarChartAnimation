//
//  ContentView.swift
//  BarChartAnimation
//
//  Created by Yağız Ata Özkan on 7.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints : [[CGFloat]] = [
        
    [50,100,150,95,57,165,90],
        [80,140,50,90,130,148,45],
        [100,180,85,67,80,120,95]
    ]
    
    @State var Days : [String] = [
        "Su","M","T","W","TH","F","Sa"
    ]
    var body: some View {
        ZStack{
            
            Color(#colorLiteral(red: 0.01333854906, green: 0.7882678509, blue: 0.6569990516, alpha: 1)).ignoresSafeArea(.all)
            VStack{
                Text("Calory Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                   
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal,24)
                
                HStack (spacing : 16){
                    BarChart(Days : Days,Count : 0,value: dataPoints[pickerSelectedItem][0])
                    BarChart(Days : Days,Count:1,value: dataPoints[pickerSelectedItem][1])
                    BarChart(Days : Days,Count:2,value: dataPoints[pickerSelectedItem][2])
                    BarChart(Days : Days,Count:3,value: dataPoints[pickerSelectedItem][3])
                    BarChart(Days : Days,Count:4,value: dataPoints[pickerSelectedItem][4])
                    BarChart(Days : Days,Count:5,value: dataPoints[pickerSelectedItem][5])
                    BarChart(Days : Days,Count:6,value: dataPoints[pickerSelectedItem][6])
                   
                }.padding(.top, 24)
                .animation(.default)
            }
            
        }
        
    }
}


struct BarChart : View {
    var Days : [String]
    var Count : Int
    var value : CGFloat
    var body : some View {
        VStack{
            ZStack (alignment : .bottom){
                Capsule().frame(width: 30, height: 200).foregroundColor(Color(#colorLiteral(red: 0.2957645357, green: 0.9047918916, blue: 0.7280185819, alpha: 0.5108133278)))
                Capsule().frame(width: 30, height: value).foregroundColor(.white)
            }
            Text(Days[Count]).padding(.top,8)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
