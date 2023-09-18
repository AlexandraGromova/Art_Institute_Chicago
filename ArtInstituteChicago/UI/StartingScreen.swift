import Foundation
import SwiftUI

struct StartingScreen: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            ZStack() {
                Image("starting_wallpaper")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .offset(x: -20)
                    .aspectRatio(contentMode: .fit)
                    .brightness(-0.1)
                VStack() {
                    ContainerForView()
                    Spacer()
                        .frame(height: 35)
                }
            }
            .ignoresSafeArea()
            .customScreen()
        }
    }
}

struct ContainerForView: View {
    
    @State private var image = UIImage()
    @State private var showSheet = false
    var vm = AppContainer.resolve(ArtworkLocalSource.self)
    @State private var userName: String = ""
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 100)
            Text(LocalizedStringKey("insertImage"))
                .foregroundColor(Color.vintageBeigeGreen)
                .customAppleSDGothicNeoThin(size: 30)
            Spacer()
                .frame(height: 15)
            VStack(){
                Image(uiImage: image.self)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .background(
                           Image(systemName: "arrow.down.to.line.circle.fill")
                               .resizable()
                               .frame(width: 200, height: 200)
                               .foregroundColor(Color.vintageBeigeGreen)
                               .clipShape(RoundedRectangle(cornerRadius: 100))
                       )
            }
            .onTapGesture {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
            Spacer()
                .frame(height: 40)
            Text(LocalizedStringKey("writeName"))
                .foregroundColor(Color.vintageBeigeGreen)
                .customAppleSDGothicNeoThin(size: 30)
            Spacer()
                .frame(height: 10)
            TextField(LocalizedStringKey("username"), text: $userName)
                .customAppleSDGothicNeoThin(size: 30)
                .padding(10)
                .frame(width:  UIScreen.main.bounds.size.width/1.5, height: 50)
                .background(Color.vintageBeigeGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Spacer()
            NavigationLink {
                MainScreen()
            } label: {
                Text(LocalizedStringKey("continue"))
                    .frame(width:  UIScreen.main.bounds.size.width/1.5, height: 60)
                    .background(Color.vintageBeigeGreen)
                    .customAmericanTypewriterLight(size: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .onChange(of: userName) { newValue in
                vm.saveUserName(name: newValue)
            }
        }
    }
}
struct StartingScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartingScreen()
    }
}
