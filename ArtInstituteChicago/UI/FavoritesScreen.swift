import Foundation
import SwiftUI

struct FavoriteScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 10)
            Text(LocalizedStringKey("settings"))
                .customAmericanTypewriterLight(size: 35)
                .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
            Spacer()
        }
        .setupScreen()
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .tint(Color.darkGreen)
                    .bold()
            }
        })
    }
}
struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
