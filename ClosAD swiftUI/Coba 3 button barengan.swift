import SwiftUI

struct Coba_3_button_barengan: View {
    @State private var xButtonPosition = CGPoint(x: 72, y: 200)
    @State var count = 0
    @State var status = true
    @State var trigger = true
    @State private var isPopupVisible = true
    @State private var xButtonTaps = [false, false, false]
    
    var body: some View {
        
        ZStack {
        
            Image("Background Judi")
            
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



#Preview {
    Coba_3_button_barengan()
}
