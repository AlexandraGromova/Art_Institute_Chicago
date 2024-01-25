import Foundation
import SwiftUI

struct EventsLIstScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AppContainer.resolve(EventsVM.self)
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false) {
                LazyVStack() {
                    ForEach(vm.dailyEvents.indices, id: \.self) { columnIndex in
                        DayView(text: vm.dailyEvents[columnIndex].first?.start_at?.toUIDate() ?? "")
                        ForEach(vm.dailyEvents[columnIndex], id: \.id) { event in
                            EventSell(locationText: event.location ?? "", title: event.title ?? "", imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 170, image_url: event.image_url ?? "")
                                .padding(.vertical, 5)
                        }
                    }
                }
            }
        }
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
struct DayView: View {
    var text : String
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .padding(.bottom, 5)
                .foregroundColor(Color.gray)
                .customAmericanTypewriterLight(size: 25)
            Spacer()
                .frame(height: 0)
            Divider()
                .frame(width: UIScreen.main.bounds.size.width - 25, height: 1)
                .background(Color.gray)
        }
    }
}


struct EventSell: View {
    var locationText: String
    var title: String
    var imageWidth: Int
    var imageHeight: Int
    var image_url: String
    var body: some View {
        ZStack() {
            AsyncImage(
                url: URL(string: image_url),
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    ShimmerLoading()
                        .frame(width:  CGFloat(imageWidth), height:  CGFloat(imageHeight))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:  CGFloat(imageWidth), height:  CGFloat(imageHeight))
                        .aspectRatio(contentMode: .fit)
                        .brightness(-0.4)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                case .failure:
                    Image("plug_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width:  CGFloat(imageWidth), height:  CGFloat(imageHeight))
                        .aspectRatio(contentMode: .fit)
                        .brightness(-0.4)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                @unknown default:
                    EmptyView()
                }
            }
            VStack() {
                Spacer()
                Text(title)
                    .lineLimit(nil)
                    .frame(width:  CGFloat(imageWidth) - 15, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 15)
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAmericanTypewriterLight(size: 25)
                Label(locationText, systemImage: "mappin.and.ellipse")
                    .lineLimit(nil)
                    .frame(width:  CGFloat(imageWidth) - 15, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 1)
                    .foregroundColor(Color.vintageBeigeGreen)
                    .customAmericanTypewriterLight(size: 15)
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
