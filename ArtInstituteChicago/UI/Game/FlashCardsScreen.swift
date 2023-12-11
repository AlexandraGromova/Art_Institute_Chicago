import Foundation
import SwiftUI

struct FlashCardsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAnswer = false
    var text = "Artwork"
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 50)
            Image("plug_image")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.size.width - 70, height: UIScreen.main.bounds.size.height/2.5)
                .background(Color.darkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            Spacer()
                .frame(height: 130)
            if !showAnswer{
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.darkGreen)
                    .onTapGesture {
                        showAnswer.toggle()
                    }
            }
            if showAnswer{
                Text(text)
                    .customAmericanTypewriterLight(size: 30)
            }
            Spacer()
            if showAnswer {
                HStack() {
                    Spacer()
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 25)
                        .foregroundColor(Color.darkRed)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.darkRed, lineWidth: 5)
                        )
                        .shadow(color: Color.darkBrown, radius: 6, x: -2, y: 2)
                    Spacer()
                    Image(systemName: "checkmark")
                        .resizable()
                        .bold()
                        .scaledToFit()
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color.vintageBeigeGreen)
                    
                        .padding()
                        .background(Color.lightGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color.darkGreen, radius: 6, x: -2, y: 2)
                    Spacer()
                }
            }
            Spacer()
                .frame(height: 40)
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

struct FlashCardsScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardsScreen()
    }
}
