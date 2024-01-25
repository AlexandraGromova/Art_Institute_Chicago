import Foundation
import SwiftUI

struct DetailExhibitionScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    let exhibition: Exhibition
    
    var body: some View {
        let textShortDescription = exhibition.short_description?.replacingOccurrences(of: "<p>", with: "")
        let cleanTextShortDescription = textShortDescription?.replacingOccurrences(of: "</p>", with: "")
        ZStack(alignment: .top) {
            VStack() {
                Spacer()
                    .frame(height: 0)
                
                AsyncImage(
                    url: URL(string: exhibition.image_url!),
                          transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ShimmerLoading()
                            .frame(width:  UIScreen.main.bounds.size.width + 50, height:  UIScreen.main.bounds.size.height/2.2)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.size.width + 50, height: UIScreen.main.bounds.size.height/2.2)
                            .aspectRatio(contentMode: .fit)
                            .brightness(-0.2)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    case .failure:
                        Image("plug_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width:  UIScreen.main.bounds.size.width + 50, height: UIScreen.main.bounds.size.height/2.2)
                            .aspectRatio(contentMode: .fit)
                            .brightness(-0.2)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    @unknown default:
                        EmptyView()
                    }
                }
                Spacer()
            }
            VStack() {
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height/2.2 - 25)
                Text(exhibition.title)
                    .lineLimit(nil)
                    .foregroundColor(Color.darkBlue)
                    .customAmericanTypewriterLight(size: 35)
                    .frame(width:  UIScreen.main.bounds.size.width - 30, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .background(Rectangle().fill(Color.vintageBeigeGreen).shadow(radius: 3))
                Text("\(DateFormating().getFormattedDate(date: exhibition.aic_start_at ?? "null")) - \n\(DateFormating().getFormattedDate(date: exhibition.aic_end_at ?? "null"))")
                    .lineLimit(3)
                    .foregroundColor(Color.darkBlue)
                    .customAmericanTypewriterLight(size: 20)
                    .frame(width:  UIScreen.main.bounds.size.width - 30, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                Label(exhibition.gallery_title ?? "null", systemImage: "mappin.and.ellipse")
                    .lineLimit(3)
                    .foregroundColor(Color.darkBlue)
                    .customAmericanTypewriterLight(size: 20)
                    .frame(width:  UIScreen.main.bounds.size.width - 30, alignment: .leading)
                    .padding(.bottom, 30)
                Text(cleanTextShortDescription ?? "null")
                    .foregroundColor(Color.darkBlue)
                    .customAmericanTypewriterLight(size: 15)
                    .frame(width:  UIScreen.main.bounds.size.width - 50,alignment: .center)
            }
        }
        .ignoresSafeArea()
        .setupScreen()
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

