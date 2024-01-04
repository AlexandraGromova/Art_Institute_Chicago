
import Foundation
import SwiftUI
struct DetailFavoriteScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State var isFavorite : Bool = false
    @State var artwork: ArtworkCD
    var vm = AppContainer.resolve(ArtworkLocalSource.self)
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
                .frame(height: 55)
            ScrollView(showsIndicators: false) {
                Spacer()
                AsyncImage(url: URL(string: "https://www.artic.edu/iiif/2/" + (artwork.image_id ?? "") + "/full/300,/0/default.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                }placeholder: {
                    ProgressView()
                        .controlSize(.large)
                        .progressViewStyle(.circular)
                        .tint(Color.darkGreen)
                        .frame(width: 50, height: 50)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(30)
                Text(artwork.title ?? "")
                    .offset(y: -15)
                    .font(
                        .custom(
                            "AmericanTypewriter-Light",
                            fixedSize: artwork.title?.count ?? 0 > 20 ? 25 : 30
                        )
                        .weight(.black)
                        
                    )
                    .foregroundColor(Color.darkGreen)
                    .frame(width: UIScreen.main.bounds.size.width - 70)
                Spacer()
                VStack(){
                    InfoAboutArtwork(text: artwork.artist_display ?? "" , title: "Artist:")
                    InfoAboutArtwork(text: artwork.place_of_origin ?? "", title: "Place:")
                    InfoAboutArtwork(text: "\(artwork.date_start)" , title: "Date:")
                    InfoAboutArtwork(text: artwork.medium_display ?? "", title: "Medium:")
                }
                .customAppleSDGothicNeoThin(size: 25)
                Spacer()
            }
            
            Button(action: {
                self.isFavorite.toggle()
               
            }) {
                Image(systemName: self.isFavorite == true ? "heart.circle.fill" : "heart.circle")
                    .resizable()
                    .scaledToFit()
                    .tint(Color.darkGreen)
                    .frame(width: 50)
            }
            .frame(alignment: .bottomTrailing)
            .offset(x: -30, y: -50)
        }
        .ignoresSafeArea()
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


