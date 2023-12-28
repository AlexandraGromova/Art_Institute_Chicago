import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    let actionSearch: (String?) -> ()
    
    var body: some View {
        HStack(){
            Spacer()
                .frame(width: 30)
            TextField ("Search...", text: $searchText)
                .customAppleSDGothicNeoThin(size: 20)
                .frame(alignment: .center)
                .lineLimit(1)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(Color.darkGreen)
                .onTapGesture {
                    actionSearch(searchText)
//                    print("search")
                }
            Spacer()
                .frame(width: 30)
        }
        .frame(width: UIScreen.main.bounds.size.width - 20, height: 40)
        .background(Color.lightBeige)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onChange(of: searchText) { newValue in
            if searchText.isEmpty {
                actionSearch(nil)
                //perekluchat na vm.isSearchMode = false & obnovit stranici
            }
        }
    }
}
