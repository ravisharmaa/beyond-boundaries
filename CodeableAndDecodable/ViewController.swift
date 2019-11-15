import UIKit

class ViewController: UIViewController {
    
    var results = [Results]()


    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        HttpRequest.get(from: Constants.apiUrl) { (movie: Movie?, error) in
            if let movie = movie {
                self.results = movie.results
                print(self.results)
            }
        }
    }

}

