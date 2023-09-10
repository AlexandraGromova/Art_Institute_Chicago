import SwiftUI
import Foundation

struct ArtworksListScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var searchText = ""
    @StateObject var vm = AppContainer.resolve(ArtWorkListVM.self)
    @State var num = 0
    var remote = RemoteSource()
    
    var body: some View {
        VStack(){
            ScrollView(showsIndicators: false){
                    ForEach(vm.artworks){ artwork in
                        NavigationLink {
                            DetailArtworksScreen(titleImage: artwork.title ?? "", textDescription: artwork.title ?? "", image_id: artwork.image_id ?? "")

                        } label: {
                            ArtworksListView(artworkTitle: artwork.title ?? "", id: artwork.id?.formatted() ?? "0")
                                .listRowSeparator(.hidden)
                                .onAppear(){
                                    num += 1
                                    print(num)
                                    if num == 12{
                                        vm.updateArtworks()
                                        num = 0
                                    }
                                }

                        }
                        Spacer()
                            .frame(height: 15)
                    }
            }
        }
        .frame(width:  UIScreen.main.bounds.size.width)
        .background(Color.vintageBeigeGreen)
        .searchable(text: $searchText)
        .listStyle(PlainListStyle())
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

struct ArtworksListView: View{
    @State var isPlaying : Bool = false
    var artworkTitle: String
    var id: String
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
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
