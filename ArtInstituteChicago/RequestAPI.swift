import Foundation

class RequestAPI {
    func getArtworks(completion: @escaping ([Data]) -> ()){
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks")
        else {return}
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let artworks = try! JSONDecoder().decode(Artworks.self, from: data!)
            print("99")
            DispatchQueue.main.async{
                completion(artworks.data)
            }
        }
        .resume()
    }
}
