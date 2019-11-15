import Foundation

class HttpRequest {
    
    //MARK: get data from a url
    
    public static func get <T: Decodable> (from url: String, completion: @escaping(T?, Error?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil,error)
                return
            }
            
            guard let jsonData = data else { return }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: jsonData)
                completion(responseObject, nil)
                return
            } catch let error  {
                completion(nil, error)
                return
            }
            
        }.resume()
    }
}
