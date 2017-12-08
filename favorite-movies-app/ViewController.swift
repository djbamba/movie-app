//
//  ViewController.swift
//  favorite-movies-app
//
//  Created by DJ Bamba on 12/8/17.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var favoriteMovies: [Movie] = []
  
  @IBOutlet var mainTableView: UITableView!
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favoriteMovies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movieCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
    
    let index: Int = indexPath.row
    movieCell.movieTitle?.text = favoriteMovies[index].title
    movieCell.movieYear?.text = favoriteMovies[index].year
    displayMovieImage(index, movieCell: movieCell)
    
    return movieCell
  }
  
  func displayMovieImage(_ row: Int, movieCell: CustomTableViewCell) {
    let url: String = (URL(string: favoriteMovies[row].imageUrl)?.absoluteString)!
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
  
  override func viewWillAppear(_ animated: Bool) {
    mainTableView.reloadData()
    
    if favoriteMovies.count == 0 {
      favoriteMovies.append(Movie(id: "tt0372784", title: "Batman Begins", year: "2005", imageUrl: "https://static.comicvine.com/uploads/original/10/100559/2128345-batmanbegins.jpg"))
    }
    super.viewWillAppear(animated)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

