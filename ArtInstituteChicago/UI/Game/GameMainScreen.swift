import Foundation
import SwiftUI

struct GameMainScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 15)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Text(LocalizedStringKey("textHistory"))
                .customAppleSDGothicNeoThin(size: 15)
                .frame(width: UIScreen.main.bounds.size.width - 50)
            Spacer()
                .frame(height: 15)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
                .frame(height: 30)
            ContainerForCells()
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
struct ContainerForCells: View {
    var body: some View {
        VStack() {
            NavigationLink {
                FlashCardsScreen()
            } label: {
                GameCell(title: LocalizedStringKey("flashCards"), textInfoGame: "")
            }
            Spacer()
                .frame(height: 20)
            GameCell(title: LocalizedStringKey("findTheName"), textInfoGame: "")
            Spacer()
                .frame(height: 20)
            GameCell(title: LocalizedStringKey("findTheDate"), textInfoGame: "")
        }
    }
}

struct GameCell: View {
    @State private var showingAlert = false
    var title: LocalizedStringKey
    var textInfoGame: String
    var body: some View {
        HStack() {
            Spacer()
                .frame(width: 1)
            Text(title)
                .customAppleSDGothicNeoThin(size: 30)
            Spacer()
            Button(action: {
                self.showingAlert.toggle()
            }) {
                Image(systemName: "exclamationmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .bold()
                    .foregroundColor(Color.darkGreen)
                
            } .alert(textInfoGame, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            Spacer()
                .frame(width: 10)
        }
        
        .frame(width: UIScreen.main.bounds.size.width - 60, height: 45)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.darkGreen, lineWidth: 5)
        )
    }
}

struct PlayMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameMainScreen()
    }
}
