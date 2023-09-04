
import Foundation
import SwiftUI

struct File: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("ic_back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                Text("Go back")
            }
        }
    }
    
    var body: some View {
            List {
                Text("sample code")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}
struct File_Previews: PreviewProvider {
    static var previews: some View {
        File()
    }
}
