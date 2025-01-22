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
      getMovie()
        
    }
    
    var movieURL = URL(string: "http://www.omdbapi.com/?s=ghost&apikey=6d1f76c5")!
    var movies: NSDictionary = [:]
    
    func getMovie(){
            let session = URLSession.shared
            
         
            
            let dataTask = session.dataTask(with: movieURL) { data, response, error in if let e = error{
                print("Error \(e)")
                
            }else{
                if let dog = data{
                    
                    if let jason = try? (JSONSerialization.jsonObject(with: dog, options: .fragmentsAllowed) as! NSDictionary){
//                        print(jason)
                        print("=(")
                        self.movies = jason
//                        print(self.movies)
                        
                        if let moviesArray = jason.value(forKey: "Search"){
                            print(moviesArray)
                            
                            
                            
                            
                        }
                        
                    }
                }
            }
                
            }
            //dispel magic
            dataTask.resume()
        
        }
    
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell()
        return myCell
    }
 

    
}




