import Foundation
import SwiftUI

struct UserProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    var scoreUser = 1500090
    var dateRegist = "the 6th of September"
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
                .frame(height: 10)
            UserView(scoreUser: scoreUser, dateRegist: dateRegist)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
            BottomView()
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

struct BottomView: View {
    var body: some View {
        VStack() {
            Text(LocalizedStringKey("quote"))
                .frame(alignment: .center)
                .customAppleSDGothicNeoThin(size: 20)
                .frame(alignment: .center)
            Text(LocalizedStringKey("hippocrates"))
                .frame(alignment: .center)
                .customAppleSDGothicNeoThin(size: 20)
                .frame(alignment: .center)
            Spacer()
                .frame(height: 10)
            Image("logo_institute")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 20)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
                .frame(height: 40)
        }
        
    }
    
}
struct UserView: View {
    @State var isCorrected = false
    @State var stateAdjustments : Bool = false
    var vm = AppContainer.resolve(ArtworkLocalSource.self)
    @State private var userName: String = "Username"
    
    var scoreUser : Int
    var dateRegist : String
    
    var body: some View {
        VStack() {
            Image(uiImage: vm.getUserPhoto(for: "userPhoto")! )
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 75))
            Spacer()
                .frame(height: 25)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
                .frame(height: 15)
            HStack() {
                if !isCorrected {
                    Text(vm.getUserName(for: "userName") ?? "error")
                        .customAppleSDGothicNeoThin(size: 30)
                }
                if isCorrected {
                    TextField("Username", text: $userName)
                        .customAppleSDGothicNeoThin(size: 30)
                        .frame(width: 100)
                }
                Button(action: {
                    self.stateAdjustments.toggle()
                    self.isCorrected.toggle()
                }) {
                    Image(systemName: self.stateAdjustments == true ? "checkmark.circle" : "highlighter")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color.darkGreen)
                }
            }
            Spacer()
                .frame(height: 15)
            Text(LocalizedStringKey("dateOfRegist"))
                .customAppleSDGothicNeoThin(size: 30)
            Text(dateRegist)
                .customAppleSDGothicNeoThin(size: 30)
            Spacer()
                .frame(height: 15)
            HStack() {
                Text(LocalizedStringKey("score"))
                    .customAppleSDGothicNeoThin(size: 30)
                Text("\(scoreUser)")
                    .customAppleSDGothicNeoThin(size: 30)
            }
        }
    }
}

struct UserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileScreen()
    }
}

