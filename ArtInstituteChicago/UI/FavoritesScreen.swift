import Foundation
import SwiftUI
import CoreData

struct FavoritesScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var artworksCD: FetchedResults<ArtworkCD>
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0){
                        ForEach(Array(zip(artworksCD.indices, artworksCD)), id: \.1.id) { index, artwork in
                        NavigationLink {
                            DetailFavoriteScreen(artwork: artwork)
                        } label: {
                            ArtworksListFavCell(artworkTitle: artwork.title ?? "", id: artwork.id_favorite ?? "")
                                .listRowSeparator(.hidden)
                        }
                            Spacer()
                                .frame(height: 15)
                    }
                }
         
            }
            Button("Clean"){
                print("clean")
                for _ in artworksCD {
                    let artworkCD = artworksCD[artworksCD.indices.lowerBound]
                    moc.delete(artworkCD)
                   }
            }
            Spacer()
                .frame(height: 20)
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

struct ArtworksListFavCell: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var artworksCD: FetchedResults<ArtworkCD>
    
    var artworkTitle: String
    var id: String
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(artworkTitle)
                    .customAppleSDGothicNeoThin(size: 20)
                    .frame(alignment: .center)
                    .lineLimit(1)
                Spacer()
                    .frame(height: 10)
                Text(id)
                    .customAppleSDGothicNeoThin(size: 20)
                    .frame(alignment: .center)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .padding(10)
        .frame(width:  UIScreen.main.bounds.size.width - 20)
        .background(Color.lightBrown)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
