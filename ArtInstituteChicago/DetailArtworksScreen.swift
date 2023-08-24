import Foundation
import SwiftUI
struct DetailArtworksScreen: View {
    @State var parametrs: String
    @State var textDescription: String
    var body: some View {
        VStack(){
            ScrollView(){
                Spacer()
                Image("plug_image")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(30)
                Spacer()
                Text(parametrs)
                    .frame(width: UIScreen.main.bounds.size.width - 40 , alignment: .leading)
                Text(textDescription)
                    .frame(width: UIScreen.main.bounds.size.width - 40)
                Spacer()
            }
        }
        .background(Color.lightBeige)
        .ignoresSafeArea()
    }
    
}
struct DetailArtworksScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailArtworksScreen(parametrs: "njounnkjn jn ijn kjnjknjnjn \n efwsffsdf", textDescription: "njounnkjn jn ijn kjnjknjnjnjnknkjnkefwnknknknknknknknknknknjnknknjnknjnnjnkjnnkjnknjknnkjnknjknjknksfkjnjknkfsdf")
    }
}
