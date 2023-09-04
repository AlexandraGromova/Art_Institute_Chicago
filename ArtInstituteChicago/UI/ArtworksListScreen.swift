import SwiftUI
import Foundation

struct ArtworksListScreen: View {
    @State var searchText = ""
    @StateObject var vm = AppContainer.resolve(ArtWorkListVM.self)
    
    var body: some View {
        VStack(){
            ScrollView(showsIndicators: false){
                ForEach(vm.artworks){ artwork in
                    NavigationLink {
                        DetailArtworksScreen(titleImage: artwork.title ?? "", textDescription: artwork.title ?? "", image_id: artwork.image_id ?? "")
                    } label: {
                        ArtworksListView(artworkTitle: artwork.title ?? "", id: artwork.id?.formatted() ?? "0")
                            .listRowSeparator(.hidden)
                    }
                    
                    Spacer()
                        .frame(height: 15)
                }
            }
        }
        .searchable(text: $searchText)
        .listStyle(PlainListStyle())
    }
    
}

struct ArtworksListView: View{
    @State var isPlaying : Bool = false
    var artworkTitle: String
    var id: String
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                Text(artworkTitle)
                    .foregroundColor(.black)
                    .frame(alignment: .center)
                    .font(.system(size: 20))
                    .lineLimit(2)
                Spacer()
                    .frame(height: 10)
                Text(id)
                    .foregroundColor(.black)
                    .frame(alignment: .center)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: self.isPlaying == true ? "heart.circle.fill" : "heart.circle")
                    .resizable()
                    .scaledToFit()
                    .tint(Color.darkBlue)
                    .frame(width: 30)
        
    }
                
        }
        .padding(10)
        .frame(width:  UIScreen.main.bounds.size.width - 20)
        .background(Color.lightBrown)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworksListScreen()
    }
}
