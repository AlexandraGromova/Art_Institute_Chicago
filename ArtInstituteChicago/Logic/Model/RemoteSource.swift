import Foundation

class RemoteSource {
    var currentPage = 1
    func getArtworks(completion: @escaping ([Artwork]) -> ()){
        
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=\(currentPage)")
        else {return}
        
        currentPage += 1
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let artworks = try! JSONDecoder().decode(ArtworkResponse.self, from: data!)
            DispatchQueue.main.async{
                print(url)
                print ("URLSEssion")
                completion(artworks.data)
            }
        }
        .resume()
    }
    
}
