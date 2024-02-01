import Foundation
import SwiftUI

struct UserProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    var vm = AppContainer.resolve(UserVM.self)
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
                .frame(height: 10)
            UserView(dateRegist: vm.getDateRegist()){
                vm.getUserName(for: "userName") ?? "error"
            } getUserPhoto: {
                vm.getSavedImage(named: "fileName")
            }
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
            Spacer()
            BottomView()
        }
        .onAppear(){
            vm.getDateRegist()
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

    var dateRegist : String
    var getUserName: () -> String?
    var getUserPhoto: () -> UIImage?
    
    var body: some View {
        VStack() {
            Image(uiImage: getUserPhoto()! )
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
            Text(getUserName() ?? "nil")
                .customAppleSDGothicNeoThin(size: 30)
             
            Spacer()
                .frame(height: 15)
            Text(LocalizedStringKey("dateOfRegist"))
                .customAppleSDGothicNeoThin(size: 30)
            Text(dateRegist)
                .customAppleSDGothicNeoThin(size: 30)
            Spacer()
                .frame(height: 15)
        }
    }
}

struct UserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileScreen()
    }
}

