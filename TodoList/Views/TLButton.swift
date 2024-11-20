
import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            } //:ZSTACK
        }
    }
}

#Preview {
    TLButton(title: "Value",
             backgroundColor: .pink,
             action: {
        //Action
    })
}
