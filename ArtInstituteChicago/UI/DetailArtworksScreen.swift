import Foundation
import SwiftUI
struct DetailArtworksScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var artworksCD: FetchedResults<ArtworkCD>
    
    @State var isFavorite : Bool
    @State var artwork: Artwork
    
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
                    InfoAboutArtwork(text: String(artwork.date_start ?? 0), title: "Date:")
                    InfoAboutArtwork(text: artwork.medium_display ?? "", title: "Medium:")
                }
                .customAppleSDGothicNeoThin(size: 25)
                Spacer()
            }
            
            Button(action: {
                if isFavorite == true{
                    let isFavorited = artworksCD.contains { item in
                        if  item.id_favorite == artwork.id?.formatted() ?? "0" {
                            moc.delete(item)
                            self.isFavorite.toggle()
                            return false
                        }
                        return false
                    }
                    
                }
                else {
                     
                    let artworkCD = ArtworkCD(context: moc)
                    artworkCD.id = UUID()
                    artworkCD.artist_display = artwork.artist_display
                    artworkCD.date_start = Int64(artwork.date_start ?? 0)
                    artworkCD.image_id = artwork.image_id
                    artworkCD.medium_display = artwork.medium_display
                    artworkCD.place_of_origin = artwork.place_of_origin
                    artworkCD.style_title = artwork.style_title
                    artworkCD.id_favorite = artwork.id?.formatted() ?? "0"
                    print("test_DetailArtworkScreen CD id favorite\(artworkCD.id_favorite) artwork_id \(artwork.id?.formatted() ?? "0")")
                    artworkCD.title = artwork.title
                    try? moc.save()
                    self.isFavorite.toggle()
                   
                 
                }
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

struct InfoAboutArtwork: View {
    var text: String
    var title: String
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
                .frame(width: 30)
            Text(title)
                .padding(5)
                .frame(alignment: .topLeading)
            Spacer()
            Text(text)
                .padding(5)
                .frame(width: UIScreen.main.bounds.size.width/2, alignment: .leading)
            Spacer()
                .frame(width: 30)
        }
    }
}
