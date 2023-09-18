import Foundation
import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 30)
            Text("Settings")
                .customAmericanTypewriterLight(size: 35)
                .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
            Spacer()
                .frame(height: 30)
            NotificationsView()
            Spacer()
                .frame(height: 20)
            AccountView()
            Spacer()
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
                .frame(height: 40)
        }
        .customScreen()
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

struct NotificationsView: View {
    var body: some View {
        VStack() {
            HStack() {
                Spacer()
                    .frame(width: 20)
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.darkGreen)
                Spacer()
                    .frame(width: 15)
                Text("Notifications")
                    .customAmericanTypewriterLight(size: 25)
                Spacer()
            }
            Spacer()
                .frame(height: 10)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
                .frame(height: 15)
            Text("Notifications")
                .customAppleSDGothicNeoThin(size: 20)
                .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
            Spacer()
                .frame(height: 10)
            Text("Notifications")
                .customAppleSDGothicNeoThin(size: 20)
                .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
        }
    }
}

struct AccountView: View {
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                    .frame(width: 20)
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.darkGreen)
                Spacer()
                    .frame(width: 15)
                Text("Account")
                    .customAmericanTypewriterLight(size: 25)
                Spacer()
            }
            Spacer()
                .frame(height: 10)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            VStack() {
                Spacer()
                    .frame(height: 15)
                Text("Notifications")
                    .customAppleSDGothicNeoThin(size: 20)
                    .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
                Spacer()
                    .frame(height: 10)
                Text("Notifications")
                    .customAppleSDGothicNeoThin(size: 20)
                    .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}

