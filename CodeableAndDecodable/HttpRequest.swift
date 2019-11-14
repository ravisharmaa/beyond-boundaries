import Foundation

class HttpRequest {
    
    public static func get <T: Decodable> (url: String, completion: @escaping(T?, Error?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil,error)
            }
            
            guard let jsonData = data else { return }
            
            do {
                let serverResponse = try JSONDecoder().decode(T.self, from: jsonData)
                completion(serverResponse, nil)
                return
            } catch let jsonError  {
                completion(nil, jsonError)
                return
            }
            
        }.resume()
    }
}
