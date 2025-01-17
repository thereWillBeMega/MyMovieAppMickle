//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        // Do any additional setup after loading the view.
        //http://www.omdbapi.com/?i=tt3896198&apikey=6d1f76c5
      var movies = getMovie()
        print(movies)
    }
    
    var movieURL = URL(string: "http://www.omdbapi.com/?s=ghost&apikey=6d1f76c5")!
        
    func getMovie() -> NSDictionary{
            let session = URLSession.shared
            
         
            
            let dataTask = session.dataTask(with: movieURL) { data, response, error in if let e = error{
                print("AHHHHHH \(e)")
                
            }else{
                if let dog = data{
                    
                    if let jason = try? (JSONSerialization.jsonObject(with: dog, options: .fragmentsAllowed) as! NSDictionary){
                        print(jason)
                        print("=(")
                        
                        return jason
                        
                        
                        
                        
                    }
                }
            }
                
            }
            //dispel magic
            dataTask.resume()
        
        }
    
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
 

    
}




