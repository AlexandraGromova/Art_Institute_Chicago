import SwiftUI
import Foundation

struct ArtworksListScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var searchText = ""
    @StateObject var vm = AppContainer.resolve(ArtworkListVM.self)
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(Array(zip(vm.artworks.indices, vm.artworks)), id: \.1.id) { index, artwork in
                        NavigationLink {
                            DetailArtworksScreen(titleImage: artwork.title ?? "", image_id: artwork.image_id ?? "")
                            
                        } label: {
                            ArtworksListCell(artworkTitle: artwork.title ?? "", id: artwork.id?.formatted() ?? "0")
                                .listRowSeparator(.hidden)
                                .onAppear() {
                                    if vm.artworks.count - 4 == index {
                                        print("test_end lastElement \(vm.artworks.count - 4) index \(index)")
                                        vm.updateArtworks()
                                    }
                                }
                        }
                        Spacer()
                            .frame(height: 15)
                    }
                    ProgressView()
                        .controlSize(.large)
                        .progressViewStyle(.circular)
                        .tint(Color.darkGreen)
                        .frame(width: 50, height: 50)
                    Spacer()
                        .frame(height: 20)
                }
            }
        }
        .customScreen()
        .searchable(text: $searchText)
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
    @State var isPlaying: Bool = false
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
                self.isPlaying.toggle()
            }) {
                Image(systemName: self.isPlaying == true ? "heart.circle.fill" : "heart.circle")
                    .resizable()
                    .scaledToFit()
                    .tint(Color.darkGreen)
                    .frame(width: 30)
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
