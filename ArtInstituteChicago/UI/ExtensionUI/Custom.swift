import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func customAmericanTypewriterLight(size: Int) -> some View {
        self
            .font(.custom("AmericanTypewriter-Light",fixedSize: CGFloat(size)).weight(.black))
            .foregroundColor(Color.darkGreen)
    }
    
    @ViewBuilder
    func customAppleSDGothicNeoThin(size: Int) -> some View {
        self
            .font(.custom("AppleSDGothicNeo-Thin",fixedSize: CGFloat(size)).weight(.black))
            .foregroundColor(Color.darkGreen)
    }
    
    func customScreen() -> some View {
        self
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color.vintageBeigeGreen)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
    }
}
