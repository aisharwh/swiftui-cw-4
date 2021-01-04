//
//  ContentView.swift
//  cw2-3
//
//  Created by MacBook` on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var button = "0"
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing:10){
                Spacer()
                HStack{
                    Spacer()
                    Text(button)
                        .modifier(TitleModifier())
                        .animation(.easeIn(duration: 0.1))
                    
                }
                HStack{
                    Text("C")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "0"}
                    Text("±").modifier(ButtonModifier(type: .gray))
                    Text("%").modifier(ButtonModifier(type: .gray))
                    Text("÷").modifier(ButtonModifier(type: .orange))
                }  
                HStack{
                    Text("7")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "7"}
                    Text("8")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "8"}
                    Text("9")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "9"}
                    Text("×").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("4")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "4"}
                    Text("5")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "5"}
                    Text("6")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "6"}
                    Text("-").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("1")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "1"}
                    Text("2")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "2"}
                    Text("3")
                        .modifier(ButtonModifier(type: .gray))
                        .onTapGesture {button = "3"}
                    Text("+").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("0").modifier(Zero())
                        .onTapGesture {button = "0"}
                    Text(".").modifier(ButtonModifier(type: .gray))
                    Text("=").modifier(ButtonModifier(type: .orange))
                }
            }
            .padding()
        }
    }
}

/** # Don't touch this code at all
 This code is to minimize the code you write for each button.
 You create modifiers and add them to each button, and they will all share same modifiers
 */

// 1. Title Modifier: To present the result
struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 120, weight: .thin, design: .default))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
}

// 2. Button Modifier:
struct ButtonModifier: ViewModifier{
    enum `Type`{case gray, orange, zero}
    var type: Type
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(width: type == .zero ? 120 : 60, height: 60)
            .background(self.type == .gray ? Color.gray : Color.orange)
            .clipShape(Circle())
            .foregroundColor(Color.white)
            .padding(2)
    }
}

// 3. Zero Modifier, this view modifier for 0 specifically, where it width is
struct Zero: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .frame(width:  120 , height: 60)
            .background(Color.gray)
            .clipShape(Capsule())
            .foregroundColor(Color.white)
        
    }
}

struct CaontentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.environment(\.colorScheme, .dark)
    }
}
