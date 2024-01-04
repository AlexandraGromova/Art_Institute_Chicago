import Foundation

class RemoteSource {
   func getArtworks(currentPage: Int, completion: @escaping (ArtworkResponse) -> ()) {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=\(currentPage)")
        else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let artworks = try! JSONDecoder().decode(ArtworkResponse.self, from: (data)!)
            DispatchQueue.main.async {
                print(url)
                completion(artworks)
            }
        }
        .resume()
    }
    
    func getSearchingArtworks(text: String, currentPage: Int, completion: @escaping (ArtworkResponse) -> ()){
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks/search?q=\(text)&page=\(currentPage)")
        else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let artworks = try! JSONDecoder().decode(ArtworkResponse.self, from: (data)!)
            DispatchQueue.main.async {
                print(url)
                completion(artworks)
            }
        }
        .resume()
    }
    
    func getArtwork(artworkIndex: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
         guard let url = URL(string: "https://api.artic.edu/api/v1/artworks/\(artworkIndex)")
         else {return}
         URLSession.shared.dataTask(with: url) { (data, _, _) in
             let artwork = try! JSONDecoder().decode(ArtworkSearchResponse.self, from: (data)!)
             DispatchQueue.main.async {
//                 print(url)
                 completion(artwork)
             }
         }
         .resume()
     }
    
    
    
    
//    func getArtworks(currentPage: Int) async -> [Artwork] {
//        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=\(currentPage)")
//        else {return []}
//        do {
//            let respons = try await URLSession.shared.data(from: url)
//            let artworks = try! JSONDecoder().decode(ArtworkResponse.self, from: respons.0)
//            return artworks.data
//        } catch {
//            return []
//        }
//    }
//
//    func test()  {
//        Task {
//            let list = await getArtworks(currentPage: 1)
//        }
//    }
    let action: () -> () = {
        
    }
    
    let sum: (Int, Int) -> (Int) = { a, b in
        return a + b
    }
    
    func test() {
        action()
    }
    
    func test2() {
        let res = sum(1, 2) //
    }
    
}
