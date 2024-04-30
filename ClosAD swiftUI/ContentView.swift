//
//  Coba 3 button barengan.swift
//  ClosAD swiftUI
//
//  Created by Nila Eleora Putri Sianturi on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var xButtonPosition = CGPoint(x: 72, y: 200)
    @State var count = 0
    @State var status = true
    @State var trigger = true
    @State private var isPopupVisible = true
    @State private var xButtonTaps = [false, false, false]
    
    var body: some View {
        
        ZStack {
            Image("Background Judi")
            
            //Untuk iklan 1 - Judi
            
            if status {
                Color.secondary
                Image("Iklan Judi")
                    .resizable()
                    .scaledToFit()
                    .opacity(trigger ? 1 : 0)
                    .frame(width: 350)
                    .animation(.easeOut(duration: 0.5), value: trigger)            }
            
            Spacer()
            
            if status {
                    
                Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .opacity(trigger ? 1 : 0)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                
                        .position(x: xButtonPosition.x, y: xButtonPosition.y)
                        .onTapGesture {
                            if count < 5 {
                                let newX = CGFloat.random(in: 72...345)
                                let newY = CGFloat.random(in: 200...650)
                                self.xButtonPosition = CGPoint(x: newX, y: newY)
                                count += 1
                                
                                print("Good Luck Next Time")
                            } else {
                                withAnimation(.easeOut(duration: 0.5)){
                                    trigger = false
                                } completion: {
                                    status = false
                                }
                                print("You Did It")
                            }
                        }
                
            }
    
            //Untuk iklan 2 - Bayi
            // Popup Window
            
            if isPopupVisible {
                ZStack {
                    Color.secondary
                    Image("Iklan Bayi No Eyes")
                    XButtonView(index: 0, isTapped: $xButtonTaps[0])
                        .position(x: 160, y: 362)
                    XButtonView(index: 1, isTapped: $xButtonTaps[1])
                        .position(x: 238, y: 345)
                    XButtonView(index: 2, isTapped: $xButtonTaps[2])
                        .position(x: 196, y: 511)
                }
                .onChange(of: xButtonTaps) {
                    if xButtonTaps.allSatisfy({ $0 }) {
                        isPopupVisible = false
                    }
                }
            }
        }
    }
}

struct XButtonView: View {
    let index: Int
    @Binding var isTapped: Bool
    
    var body: some View {
        Text("**X**")
            .font(.system(.title, design: .rounded))
            .padding()
            .foregroundColor(isTapped ? Color.white : Color.black)
            .cornerRadius(2)
            .onTapGesture {
                self.isTapped.toggle()
                if self.isTapped {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        self.isTapped = false
                    }
                }
            }
    }
}


#Preview {
    ContentView()
}
