import SwiftUI
import Foundation
import CoreData

struct ArtworksListScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AppContainer.resolve(ArtworkListVM.self)
    @State var isHidden = false
    
    
    var body: some View {
        VStack() {
            SearchView { text in
                vm.searchArtworks(text)
            }
            Spacer()
                .frame(height: 15)
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(Array(zip(vm.artworks.indices, vm.artworks)), id: \.1.id) {index, artwork in
                        NavigationLink {
                            let isFavorited = vm.artworksCD.contains { item in
                                item.id == artwork.id
                            }
                            DetailArtworksScreen(isFavorite: isFavorited, artwork: artwork)
                        } label: {
                            let isFavorited = vm.artworksCD.contains { item in
                                item.id == artwork.id
                            }
                            ArtworksListCell(isFavorite: isFavorited , artwork: artwork, artworkTitle: artwork.title ?? "", id: artwork.id ?? 0) { artwork in
                                if vm.isSearchMode {
                                    vm.saveSearchArtwork(artworkId: artwork.id ?? 0)
                                }
                                else { vm.saveArtwork(artwork: artwork) }
                            } onDeleteTapAction: {int in vm.deleteFavorite(artworkId: int)}
                                .listRowSeparator(.hidden)
                                .onAppear() {
                                    isHidden = vm.updateIsHidden()
                                    if vm.artworks.count - 4 == index {
                                        if vm.isSearchMode {
                                            vm.updateSearchingArtworks()
                                        } else {
                                            vm.updateArtworks()
                                        }
                                    }
                                }
                        }
                        Spacer()
                            .frame(height: 15)
                    }
                    if isHidden == false {
                        ProgressView()
                            .controlSize(.large)
                            .progressViewStyle(.circular)
                            .tint(Color.darkGreen)
                            .frame(width: 50, height: 50)
                        
                    }
                    Spacer()
                        .frame(height: 20)
                }
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

struct ArtworksListCell: View {
    
    @State var isFavorite: Bool
    var artwork: Artwork
    var artworkTitle: String
    var id: Int
    var onFavoriteTapAction: (Artwork) -> ()
    var onDeleteTapAction: (Int) -> ()
    
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
            Button(action: {
                if self.isFavorite == true {
                    print("test_Button \(id)")
                    onDeleteTapAction(id)
                    
                    self.isFavorite.toggle()
                }
                else {
                    onFavoriteTapAction(artwork)
                    self.isFavorite.toggle()
                }
            })
            
            {
                if isFavorite {
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .tint(Color.darkGreen)
                        .frame(width: 30)
                } else {
                    Image(systemName: "heart.circle")
                        .resizable()
                        .scaledToFit()
                        .tint(Color.darkGreen)
                        .frame(width: 30)
                }
            }
        }
        .padding(10)
        .frame(width:  UIScreen.main.bounds.size.width - 20)
        .background(Color.lightBrown)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworksListScreen()
    }
}
