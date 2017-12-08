//
//  SearchViewController.swift
//  favorite-movies-app
//
//  Created by DJ Bamba on 12/8/17.
//
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet var searchText: UITextField!
  @IBOutlet var tableView: UITableView!
  var searchResults: [Movie] = []
  
  
  @IBAction func search (sender: UIButton) {
    print("Searching....")
    var searchTerm = searchText!.text
    if searchTerm.characters.count > 2 {
      
    }
  }
  
  func retrieveMoviesByTerm(searchTerm: String) {
    let url = "https://www.omdbapi.com/?s=\(searchTerm)&type=movie&r=json"
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Search Results"
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    // grouped vertival sections of the tableview
    return 1
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    // Group title "Search Results" height
    return 0.1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // at init/appear ... this runs for each visible cell that needs to render
    let movieCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
    
    let index: Int = indexPath.row
    movieCell.favoriteButton.tag = index
    
    movieCell.movieTitle?.text = searchResults[index].title
    movieCell.movieYear?.text = searchResults[index].year
    
    displayMovieImage(index, movieCell: movieCell)
    
    return movieCell
    
  }

  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func displayMovieImage(_ row: Int, movieCell: CustomTableViewCell) {
    let url: String = (URL(string: searchResults[row].imageUrl)?.absoluteString)!
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {(data, response, error) -> Void in
      if error != nil {
        print(error!)
        return
      }
      
      DispatchQueue.main.async(execute: {
        let image = UIImage(data: data!)
        movieCell.movieImageView?.image = image})
    }).resume()
  }

}
