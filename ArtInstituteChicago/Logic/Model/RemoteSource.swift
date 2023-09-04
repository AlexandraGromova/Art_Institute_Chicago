import Foundation

class RemoteSource {
    func getArtworks(completion: @escaping ([ArtWork]) -> ()){
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks")
        else {return}
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let artworks = try! JSONDecoder().decode(ArtWorkResponse.self, from: data!)
            DispatchQueue.main.async{
                completion(artworks.data)
            }
        }
        .resume()
    }
}
