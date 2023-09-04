import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func customText() -> some View {
        self.font(.custom(
            "AppleSDGothicNeo-Thin",fixedSize: 25).weight(.black)
        ).foregroundColor(Color.darkGreen)
    }
    func customView2() -> some View {
        self.padding(5)
    }
}
