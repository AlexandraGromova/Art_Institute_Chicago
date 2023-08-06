import SwiftUI

struct ArtworksList: View {
    @State var artworks: [Data] = []
    var body: some View {
        ZStack {
            List(artworks) { artwork in
                VStack{
                    Text(artwork.title)
                                  .foregroundColor(.black)
                                  .frame(alignment: .center)
                                  .font(.system(size: 30))
                                  .multilineTextAlignment(.leading)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear(){
            RequestAPI().getArtworks{ (artworks) in
                self.artworks = artworks
            }
        }
    }
}

struct





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworksList()
    }
}
