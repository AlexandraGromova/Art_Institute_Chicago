import SwiftUI
import Foundation
import CoreData

struct FavoritesScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AppContainer.resolve(FavoritesVM.self)
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(Array(zip(vm.artworksCD.indices, vm.artworksCD)), id: \.1.id) { index, artwork in
                        NavigationLink {
                            DetailArtworksScreen(isFavorite: true, artwork: artwork) 
                        } label: {
                            ArtworksListFavCell(artworkTitle: artwork.title ?? "", id: artwork.id ?? 0)
                            }
                        .onAppear(){
                            print("test_FavoritesScreen_artwork = \(artwork.title), \(artwork.place_of_origin)")
                        }
                        Spacer()
                            .frame(height: 15)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                }
        }
        .onAppear() {
            vm.getFavoritsSubscription()
        }
        .setupScreen()
        .listStyle(PlainListStyle())
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
    
    var artworkTitle: String
    var id: Int
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(artworkTitle)
                    .customAppleSDGothicNeoThin(size: 20)
                    .frame(alignment: .center)
                    .lineLimit(1)
                Spacer()
                    .frame(height: 10)
                Text("\(id)")
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
