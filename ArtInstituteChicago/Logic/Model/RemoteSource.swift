import Foundation

class RemoteSource {
    func getArtworks(currentPage: Int, completion: @escaping (ArtworkResponse) -> ()) {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=\(currentPage)")
        else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let artworks = try! JSONDecoder().decode(ArtworkResponse.self, from: (data)!)
            DispatchQueue.main.async {
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
                completion(artworks)
            }
        }
        .resume()
    }
    
    func getArtwork(artworkId: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks/\(artworkId)")
        else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let artwork = try! JSONDecoder().decode(ArtworkSearchResponse.self, from: (data)!)
            DispatchQueue.main.async {
                completion(artwork)
            }
        }
        .resume()
    }
    
    func getExhibitions(currentPage: Int, completion: @escaping (ExhibitionResponse) -> ()){
        guard let url = URL(string: "https://api.artic.edu/api/v1/exhibitions/search?query[term][status]=Confirmed&fields=id,title,image_url,status,short_description,gallery_title,aic_start_at,aic_end_at&page=\(currentPage)")
        else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let exhibitions = try! JSONDecoder().decode(ExhibitionResponse.self, from: (data)!)
            DispatchQueue.main.async {
                completion(exhibitions)
            }
        }
        .resume()
    }
    
    func getEvents(completion: @escaping (EventResponse) -> ()) {
        guard let url = URL(string: "https://api.artic.edu/api/v1/event-occurrences/search?fields=event_id,id,title,image_url,start_at,end_at,location&limit=100")
        else {return}
        let jsonBody = "{\"sort\" : [ {\"start_at\" : {\"order\" : \"asc\"}}]}"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonBody.data(using: .utf8)
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let events = try! JSONDecoder().decode(EventResponse.self, from: (data)!)
            DispatchQueue.main.async {
                print(url)
                completion(events)
            }
        }
        .resume()
        
    }
}
