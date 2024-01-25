import Foundation
import SwiftUI

struct MainScreen: View {
    
    var vm = AppContainer.resolve(ArtworkLocalSource.self)
    
    var body: some View {
        NavigationStack {
            VStack() {
                ScrollView(showsIndicators: false) {
                    HStack() {
                        Spacer()
                            .frame(width: 15)
                        NavigationLink {
                            SettingsScreen()
                        } label: {
                            Image(systemName: "gearshape.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.darkGreen)
                                .frame(width: 40)
                        }
                        Spacer()
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
                            .frame(width: 15)
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
                    HStack() {
                        Spacer()
                        NavigationLink {
                            GameMainScreen()
                        } label: {
                            MainButton(title: LocalizedStringKey("play"), imageWidth: Int(UIScreen.main.bounds.size.width/2) - 20, imageHeight: 100)
                        }
                        Spacer()
                        
                        NavigationLink {
                            FavoritesScreen()
                        } label: {
                            MainButton(title: LocalizedStringKey("favorite"), imageWidth: Int(UIScreen.main.bounds.size.width/2) - 20, imageHeight: 100)
                        }
                          Spacer()
                    }
                    NavigationLink {
                        EventsLIstScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("events"), imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 150,  isLarge: true)
                    }
                    NavigationLink {
                        ArtworksListScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("artworks"), imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 100)
                    }
                    NavigationLink {
                        ExhibitionsListScreen()
                    } label: {
                        MainButton(title: LocalizedStringKey("exhibitions"), imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 100)
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
    var imageWidth: Int
    var imageHeight: Int
    var isLarge = false
    var body: some View {
        ZStack(alignment: .leading) {
            Image("second_plug_image")
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
