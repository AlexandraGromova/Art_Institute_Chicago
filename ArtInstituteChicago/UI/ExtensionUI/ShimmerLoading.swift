import Foundation
import SwiftUI

struct ShimmerLoading: View {
    
    let gradientColor = [Color.gray, Color.clear, Color.gray]
    @State var startPoint: UnitPoint = .init(x: -1, y: 0.5)
    @State var endPoint: UnitPoint = .init(x: 0, y: 0.5)
    
    var body: some View {
        LinearGradient(colors: gradientColor, startPoint: startPoint, endPoint: endPoint)
            .onAppear() {
                withAnimation(.easeInOut(duration: 15).repeatForever(autoreverses: true)) {
                    startPoint = .init(x: 1.5, y: 0.5)
                    endPoint = .init(x: 2.5, y: 0.5)
                }
            }
    }
}
