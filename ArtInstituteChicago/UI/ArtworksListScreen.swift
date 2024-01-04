import SwiftUI
import Foundation
import CoreData

struct ArtworksListScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AppContainer.resolve(ArtworkListVM.self)
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var artworksCD: FetchedResults<ArtworkCD>
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
                    ForEach(Array(zip(vm.artworks.indices, vm.artworks)), id: \.1.id) { index, artwork in
                        NavigationLink {
                            let isFavorited = artworksCD.contains { item in
                                item.id_favorite == artwork.id?.formatted() ?? "0"
                            }
                            DetailArtworksScreen(isFavorite: isFavorited, artwork: artwork)
                                .onAppear { print("🟠 Appear") }
                        } label: {
                            let isFavorited = artworksCD.contains { item in
                                item.id_favorite == artwork.id?.formatted() ?? "0"
                            }
                            ArtworksListCell(isFavorite: isFavorited , artwork: artwork, artworkTitle: artwork.title ?? "", id: artwork.id?.formatted() ?? "0")
                                .listRowSeparator(.hidden)
                                .onAppear() {
                                    print("🟢 OnAppear")
                                    print("test_ArtworkList_onAppear_isFavorited =\(isFavorited)")
                                    vm.getMoreInfoArtwork(artworkIndex: artwork.id ?? 0)
                                    isHidden = vm.updateIsHidden()
                                    if vm.artworks.count - 4 == index {
                                        if vm.isSearchMode {
                                            vm.updateSearchingArtworks()
                                            print("test_isHidden \(isHidden)")
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
//        .onAppear { print("🔴 OnAppear") }
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
    
    @StateObject var vm = AppContainer.resolve(ArtworkListVM.self)
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var artworksCD: FetchedResults<ArtworkCD>
    
    @State var isFavorite: Bool
    var artwork: Artwork
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
            Button(action: {
               
                if self.isFavorite == true{
                    let isFavorited = artworksCD.contains { item in
                        if  item.id_favorite == id {
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
                    artworkCD.id_favorite = id
                    print("test_ArtworkListScreen CD id favorite\(artworkCD.id_favorite) artwork_id \(id)")
                    artworkCD.title = artworkTitle
                    try? moc.save()
                    self.isFavorite.toggle()
                }
            }) 
            
            {
                if isFavorite{
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
        .onAppear(){
            print("test_ArtworkCell_onAppear_isFavorite = \(isFavorite)")
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
