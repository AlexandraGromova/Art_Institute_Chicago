import Foundation
import SwiftUI
struct DetailArtworksScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var titleImage: String
    @State var textDescription: String
    @State var image_id: String
    @State var isPlaying : Bool = false
    var body: some View {
        VStack(alignment: .trailing){
            Spacer()
                .frame(height: 55)
            ScrollView(showsIndicators: false){
                Spacer()
                AsyncImage(url: URL(string: "https://www.artic.edu/iiif/2/" + image_id + "/full/300,/0/default.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .controlSize(.large)
                        .progressViewStyle(.circular)
                        .tint(Color.darkGreen)
                        .frame(width: 50, height: 50)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(30)
                Text(titleImage)
                    .offset(y: -15)
                    .font(
                        .custom(
                            "AmericanTypewriter-Light",
                            fixedSize: 30)
                        .weight(.black)
                        
                    )
                    .foregroundColor(Color.darkGreen)
                Spacer()
                HStack(){
                    VStack(alignment: .leading){
                        Text("Artist:")
                            .padding(5)
                        Text("Place:")
                            .padding(5)
                        Text("Date:")
                            .padding(5)
                        Text("Medium:")
                            .padding(5)
                    }
                    VStack(alignment: .leading){
                        Text("Artist")
                            .padding(5)
                        Text("Place")
                            .padding(5)
                        Text("Date")
                            .padding(5)
                        Text("Medium")
                            .padding(5)
                    }
                }.customText()
                    .frame(width: UIScreen.main.bounds.size.width - 60 , alignment: .leading)
                Spacer()
            }
            
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: self.isPlaying == true ? "heart.circle.fill" : "heart.circle")
                    .resizable()
                    .scaledToFit()
                    .tint(Color.darkGreen)
                    .frame(width: 50)
            }
            .frame(alignment: .bottomTrailing)
            .offset(x: -30, y: -50)
            
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(Color.vintageBeigeGreen)
        
               .edgesIgnoringSafeArea(.bottom)
               .navigationBarBackButtonHidden(true)
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
struct DetailArtworksScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailArtworksScreen(titleImage: "njounnkjn jn ijn", textDescription: "njounnkjnf", image_id: "i")
    }
}
