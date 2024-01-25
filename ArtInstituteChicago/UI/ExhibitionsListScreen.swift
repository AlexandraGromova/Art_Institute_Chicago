import Foundation
import SwiftUI

struct ExhibitionsListScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AppContainer.resolve(ExhibitionsVM.self)
    
    var body: some View {
        VStack() {
            ScrollView(showsIndicators: false) {
                LazyVStack(){
                    ForEach(Array(zip(vm.exhibition.indices, vm.exhibition)), id: \.1.id) {index, exhibition in
                        NavigationLink {
                            DetailExhibitionScreen(exhibition: exhibition)
                        } label: { ExhibitionSell(title: exhibition.title, imageWidth: Int(UIScreen.main.bounds.size.width) - 25, imageHeight: 150, image_url: exhibition.image_url ?? "")
                                .padding(.vertical, 5)
                                .onAppear() {
                                    if vm.exhibition.count - 4 == index {
                                        vm.getExhibitions()
                                    }
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
}

struct ExhibitionSell: View {
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
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

