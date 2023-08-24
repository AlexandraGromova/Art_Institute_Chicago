import Foundation
import SwiftUI

struct HomeScreen: View {
    @State var isActivated = false
    var body: some View {
        NavigationStack {
            VStack(){
                HStack(){
                    Spacer()
                        .frame(width: 15)
                    Image(systemName: "gearshape.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                    Spacer()
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                    Spacer()
                        .frame(width: 15)
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                    Spacer()
                        .frame(width: 15)
                }
                Spacer()
                NavigationLink {
                    DetailArtworksScreen(parametrs: "kjbljb", textDescription: "nklnl")
                      } label: {
                          Text("Welcome,\nSasha")
                              .lineLimit(nil)
                              .foregroundColor(.black)
                              .frame(width: UIScreen.main.bounds.size.width - 25, alignment: .leading)
                              .font(.system(size: 40) .bold())
                              .multilineTextAlignment(.leading)
                              .padding(15)
                      }
                ContentNewView()
            }
        }
    }
}

struct ContentNewView: View{
    var body: some View {
        NavigationStack {
                VStack {
                    Spacer()
                    HStack() {
                        Spacer()
                        SmallView(title: "Play")
                            .contentShape(Rectangle())
                            .onTapGesture {
                                print("test_tap other")
                            }
                        Spacer()
                        SmallView(title: "Favorite")
                        Spacer()
                    }
                    BigView()
                    MediumView(title: "Artworks")
                    MediumView(title: "Exhibitions")
                }
        }
    }
}

struct MediumView: View {
    var title: String
    var body: some View {
        ZStack(alignment: .leading){
            Image("plug_image")
            NavigationLink {
                ArtworksList()
            } label: {
                Text(title)
                    .frame(alignment: .topLeading)
                    .foregroundColor(.white)
                    .font(.system(size: 30) .bold())
                    .padding(210)
                    .offset(y: -10)
            }
//            Text(title)
//                .frame(alignment: .topLeading)
//                .foregroundColor(.white)
//                .font(.system(size: 30) .bold())
//                .padding(210)
//                .offset(y: -10)
        }
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(5)
    }
}
struct SmallView: View {
    var title: String
    var body: some View {
        ZStack(alignment: .leading){
            Image("plug_image")
            Text(title)
                .frame(alignment: .topLeading)
                .foregroundColor(.white)
                .font(.system(size: 30) .bold())
                .padding(300)
                .offset(y: -15)
        }
        .frame(width: UIScreen.main.bounds.size.width/2 - 20, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture {
            print("test_tap other")
        }
    }
}
struct BigView: View {
    var body: some View {
        ZStack(){
            Image("plug_image")
        }
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(5)
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
