import Foundation
import SwiftUI

struct InfoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(){
            ScrollView(showsIndicators: false){
                Image("institute_photo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width - 45, height: 150)
                    .padding()
                    .border(Color.darkGreen, width: 15)
                Spacer()
                    .frame(height: 25)
                Text(LocalizedStringKey("textHistory"))
                    .customAppleSDGothicNeoThin(size: 15)
                    .frame(width: UIScreen.main.bounds.size.width - 50)
                Divider()
                    .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                    .background(Color.gray)
                Spacer()
                    .frame(height: 20)
                InformacionView()
                Spacer()
                    .frame(height: 40)
            }
         
        }
        .customScreen()
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
struct InformacionView: View{
    var body: some View {
        VStack(){
            HoursView()
            LocationView()
            AdmissionView()
            SocialNetworksConteiner()
        }
    }
}

struct HoursView: View{
    var body: some View {
        let days = ["Mon", "Tue–Wed", "Thu", "Fri–Sun"]
        let hours = ["11-5", "Closed", "11-8", "11-5"]
        VStack(){
            TitleView(title: LocalizedStringKey("hours"))
            Spacer()
                .frame(height: 15)
            HStack(){
                Spacer()
                VStack(alignment: .leading){
                    ForEach (days, id: \.self){ day in
                        Text(day)
                            .customAppleSDGothicNeoThin(size: 15)
                            .frame(height: 17)
                    }
                }
                .offset(x: -25)
                Spacer()
                VStack(alignment: .leading){
                    ForEach (hours, id: \.self){ hour in
                        Text(hour)
                            .customAppleSDGothicNeoThin(size: 15)
                            .frame(height: 17)
                    }
                }
                .offset(x: -25)
                Spacer()
            }
            Spacer()
                .frame(height: 15)
        }
    }
}
struct LocationView: View{
    var body: some View {
        VStack(){
            TitleView(title: LocalizedStringKey("location"))
            Spacer()
                .frame(height: 20)
            HStack(){
                VStack(){
                    Image("location_institute")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .padding(0)
                        .border(Color.darkGreen, width: 5)
                }
                VStack(alignment: .leading){
                    Text(LocalizedStringKey("michigaAvenueEntrance"))
                        .customAppleSDGothicNeoThin(size: 15)
                    Link(LocalizedStringKey("getDirections"), destination: URL(string: "https://www.google.com/maps/place/The+Art+Institute+of+Chicago/@41.8795885,-87.6262882,17z/data=!3m1!4b1!4m6!3m5!1s0x880e2ca3e2d94695:0x4829f3cc9ca2d0de!8m2!3d41.8795845!4d-87.6237133!16s%2Fm%2F027hqc_?entry=tts&shorturl=1")!)
                        .font(.system(size: 15))
                    Text(LocalizedStringKey("modernWingEntrance"))
                        .customAppleSDGothicNeoThin(size: 15)
                    Link(LocalizedStringKey("getDirections"), destination: URL(string: "https://www.google.com/maps/place/The+Art+Institute+of+Chicago/@41.8784119,-87.620378,17z/data=!4m6!3m5!1s0x880e2ca3e2d94695:0x4829f3cc9ca2d0de!8m2!3d41.8795845!4d-87.6237133!16s%2Fm%2F027hqc_?entry=tts&shorturl=1")!)
                        .font(.system(size: 15))
                }
                .offset(x: 10)
            }
        }
        Spacer()
            .frame(height: 20)
    }
}

struct AdmissionView: View{
    
    let admissions = ["General Admission", "Chicago Residents", "Illinos Resident", "Fast Pass"]
    let ages = ["Adult","Seniors (65+)","Students","Teens (14-17)","Children","Members"]
    let prices = ["$32","$26","$26","$26","Free","Free"]
    
    var body: some View {
        VStack(){
            TitleView(title: LocalizedStringKey("admission"))
            HStack(){
                Spacer()
                VStack(alignment: .leading){
                    Spacer()
                        .frame(height: 10)
                    ForEach (admissions, id: \.self){ admission in
                        Text(admission)
                            .customAppleSDGothicNeoThin(size: 15)
                        Spacer()
                            .frame(height: 5)
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.size.width/2 - 30, alignment: .leading)
                .offset(x: 10)
                Divider()
                    .frame(width: 1, height: 110)
                    .background(Color.gray)
                
                HStack(){
                    Spacer()
                        .frame(width: 4)
                    VStack(alignment: .leading){
                        Spacer()
                            .frame(height: 10)
                        ForEach (ages, id: \.self){ age in
                            Text(age)
                                .customAppleSDGothicNeoThin(size: 15)
                            Spacer()
                                .frame(height: 2)
                        }
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Spacer()
                            .frame(height: 10)
                        ForEach (prices, id: \.self){ price in
                            Text(price)
                                .customAppleSDGothicNeoThin(size: 15)
                            Spacer()
                                .frame(height: 2)
                        }
                        Spacer()
                    }
                    Spacer()
                        .frame(width: 0)
                }
                .frame(width: UIScreen.main.bounds.size.width/2 - 30, alignment: .leading)
                Spacer()
            }.frame(width: UIScreen.main.bounds.size.width)
        }
        Divider()
            .frame(width: UIScreen.main.bounds.size.width, height: 1)
            .background(Color.gray)
    }
}

struct TitleView: View{
    var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .customAppleSDGothicNeoThin(size: 20)
            .frame(width: UIScreen.main.bounds.size.width - 25,  alignment: .leading)
        Spacer()
            .frame(height: 0)
        Divider()
            .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
            .background(Color.gray)
        
    }
}

struct SocialNetworksConteiner: View{
    var body: some View {
        HStack(){
            Spacer()
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 20)
                Text(LocalizedStringKey("followUs"))
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAppleSDGothicNeoThin(size: 20)
                Spacer()
                    .frame(height: 10)
                Link(LocalizedStringKey("facebook"), destination: URL(string: "https://www.facebook.com/artic")!)
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAppleSDGothicNeoThin(size: 15)
                Link(LocalizedStringKey("twitter"), destination: URL(string: "https://twitter.com/artinstitutechi")!)
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAppleSDGothicNeoThin(size: 15)
                Link(LocalizedStringKey("instagram"), destination: URL(string: "https://www.instagram.com/artinstitutechi/")!)
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAppleSDGothicNeoThin(size: 15)
                
                Link(LocalizedStringKey("youTube"), destination: URL(string: "https://www.youtube.com/user/ArtInstituteChicago")!)
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAppleSDGothicNeoThin(size: 15)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width/2 - 30)
            .offset(x: -20)
            Divider()
                .frame(width: 1, height: 120)
                .background(Color.vintageBeigeGreen)
            VStack(alignment: .center){
                Spacer()
                    .frame(height: 20)
                    .background(Color.red)
                Text(LocalizedStringKey("website"))
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAppleSDGothicNeoThin(size: 20)
                Spacer()
                    .frame(height: 5)
                Image("logo_institute")
                    .resizable()
                    .padding(3)
                    .frame(width: 65, height: 65)
                    .border(Color.vintageBeigeGreen, width: 3)
                Spacer()
                    .frame(height: 10)
                Text("https://www.artic.edu/visit")
                    .customAppleSDGothicNeoThin(size: 10)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width/2 - 30, alignment: .leading )
            .offset(x: 20)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width, height: 150)
        .background(Color.darkGreen)
    }

}
struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
