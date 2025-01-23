//


import UIKit


class AppData{
    
    var currentMovieIndex: Int = 0
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        // Do any additional setup after loading the view.
        //http://www.omdbapi.com/?i=tt3896198&apikey=6d1f76c5
      getMovie()
        tableViewOutlet.reloadData()
        
    }
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var errorOutlet: UILabel!
    
    var searchedMovie = "ghost"
    var movieURL = URL(string: "http://www.omdbapi.com/?s=ghost&apikey=6d1f76c5")!
    var movies: [NSDictionary] = []
    
    
    @IBAction func searchAction(_ sender: Any) {
        searchedMovie = textFieldOutlet.text!
        print(searchedMovie)
        movieURL = URL(string: "http://www.omdbapi.com/?s=\(searchedMovie)&apikey=6d1f76c5")!
        print(movieURL)
        getMovie()
            self.tableViewOutlet.reloadData()
//        self.tableViewOutlet.reloadData()
//        self.tableViewOutlet.reloadData()
//        self.tableViewOutlet.reloadData()
//        self.tableViewOutlet.reloadData()
   
  
  
     
    }
    
    
    func getMovie(){
            let session = URLSession.shared
            
         
            
            let dataTask = session.dataTask(with: movieURL) { data, response, error in if let e = error{
                print("Error \(e)")
                
            }else{
                if let dog = data{
                    
                    if let jason = try? (JSONSerialization.jsonObject(with: dog, options: .fragmentsAllowed) as! NSDictionary){
//                        print(jason)
                        print("=(")
                       
//                        print(self.movies)
                        if let moviesArray = jason.value(forKey: "Search") as? [NSDictionary]{
                            print(moviesArray)
                            self.movies = moviesArray
                            DispatchQueue.main.async {
                                self.errorOutlet.isHidden = true
                            }
                           
                            
                            
                        }else{
                            DispatchQueue.main.async {
                                self.errorOutlet.isHidden = false

                            }
                        }
                        
                    }
                }
            }
                
            }
            //dispel magic
            dataTask.resume()
        
        }
    
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.currentMovieIndex = indexPath.row
        performSegue(withIdentifier: "theSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        myCell.textLabel?.text = movies[indexPath.row].value(forKey: "Title") as? String
//        myCell.textLabel?.text = "Hello"
        return myCell
    }
 

    
}




