import Foundation
import SwiftUI

struct MainScreen: View {
    
    var vm = AppContainer.resolve(UserVM.self)
    
    var body: some View {
        NavigationStack {
            VStack() {
                ScrollView(showsIndicators: false) {
                    HStack() {
                        Spacer()
                            .frame(width: 15)
                        NavigationLink {
                            InfoScreen()
                        } label: {
                            Image(systemName: "questionmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.darkGreen)
                                .frame(width: 40)
                        }
                        Spacer()
                        NavigationLink {
                            UserProfileScreen()
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.darkGreen)
                                .frame(width: 40)
                        }
                        Spacer()
                            .frame(width: 15)
                    }
                    Spacer()
                        .frame(height: 15)
                    Text(LocalizedStringKey("welcome"))
                        .lineLimit(nil)
                        .frame(width: UIScreen.main.bounds.size.width - 25, alignment: .leading)
                        .customAmericanTypewriterLight(size: 40)
                    Text(vm.getUserName(for: "userName") ?? "error")
                        .lineLimit(nil)
                        .frame(width: UIScreen.main.bounds.size.width - 25, alignment: .leading)
                        .customAmericanTypewriterLight(size: 40)
                    NavigationLink {
                        ArtworksListScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("artworks"), image: "plug_image", imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 100)
                    }
                    NavigationLink {
                        EventsLIstScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("events"), image: "plug_events", imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 150,  isLarge: true)
                    }
                    NavigationLink {
                        ExhibitionsListScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("exhibitions"), image: "plug_exhibitions", imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 100)
                    }
                    NavigationLink {
                        FavoritesScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("favorite"), image: "plug_favorite", imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 100)
                    }
                    Spacer()
                }
            }
            .background(Color.vintageBeigeGreen)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MainButton: View {
    var title: LocalizedStringKey
    var image: String
    var imageWidth: Int
    var imageHeight: Int
    var isLarge = false
    var body: some View {
        ZStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width:  CGFloat(imageWidth), height:  CGFloat(imageHeight))
                .aspectRatio(contentMode: .fit)
                .brightness(-0.2)
            Text(title)
                .offset(x: 10, y: isLarge ? -30 : -15)
                .foregroundColor(Color.vintageBeigeGreen)
                .customAmericanTypewriterLight(size: 25)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
