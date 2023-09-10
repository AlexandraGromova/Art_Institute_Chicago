import Foundation
import SwiftUI

struct MainScreen: View {
    var nameUser = "Sasha"
    var body: some View {
        NavigationStack{
            VStack(){
                ScrollView(showsIndicators: false){
                    HStack(){
                        Spacer()
                            .frame(width: 15)
                        Image(systemName: "gearshape.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.darkGreen)
                            .frame(width: 40)
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
                        .foregroundColor(Color.darkGreen)
                        .font(.custom("AmericanTypewriter-Light",
                                      fixedSize: 40).weight(.black))
                    Text(nameUser)
                        .lineLimit(nil)
                        .frame(width: UIScreen.main.bounds.size.width - 25, alignment: .leading)
                        .foregroundColor(Color.darkGreen)
                        .font(.custom("AmericanTypewriter-Light",
                                      fixedSize: 40).weight(.black))
                    HStack() {
                        Spacer()
                        ZStack(alignment: .leading){
                            Image("second_plug_image")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width/2 - 20, height: 100)
                                .aspectRatio(contentMode: .fit)
                                        .brightness(-0.2)
                            Text(LocalizedStringKey("play"))
                                .offset(x: 10, y: -15)
                                .foregroundColor(Color.vintageBeigeGreen)
                                .customTextTypewriter()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        Spacer()
                        ZStack(alignment: .leading){
                            Image("second_plug_image")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width/2 - 20, height: 100)
                                .aspectRatio(contentMode: .fit)
                                        .brightness(-0.2)
                            Text(LocalizedStringKey("favorite"))
                                .offset(x: 10, y: -15)
                                .foregroundColor(Color.vintageBeigeGreen)
                                .customTextTypewriter()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        Spacer()
                    }
                    LargeView(title: LocalizedStringKey("news"))
                    NavigationLink {
                        ArtworksListScreen()
                    } label: {
                        MediumView(title: LocalizedStringKey("artworks"))
                    }
                    MediumView(title: LocalizedStringKey("exhibitions"))
                    Spacer()
                }
            }
            .background(Color.vintageBeigeGreen)
        }
    }
}

struct MediumView: View {
    var title: LocalizedStringKey
    var body: some View {
        ZStack(alignment: .leading){
            Image("second_plug_image")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 100)
                .aspectRatio(contentMode: .fit)
                        .brightness(-0.2)
                Text(title)
                .offset(x: 10, y: -15)
                .foregroundColor(Color.vintageBeigeGreen)
                .customTextTypewriter()
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


struct LargeView: View {
    var title: LocalizedStringKey
    var body: some View {
        ZStack(alignment: .leading){
            Image("second_plug_image")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 150)
                .aspectRatio(contentMode: .fit)
                        .brightness(-0.2)
            Text(title)
            .offset(x: 10, y: -35)
            .foregroundColor(Color.vintageBeigeGreen)
            .customTextTypewriter()
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
