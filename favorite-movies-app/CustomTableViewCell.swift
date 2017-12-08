//
//  CustomTableViewCell.swift
//  favorite-movies-app
//
//  Created by DJ Bamba on 12/8/17.
//
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  @IBOutlet var movieImageView: UIImageView!
  @IBOutlet var movieTitle: UILabel!
  @IBOutlet var movieYear: UILabel!
  @IBOutlet var favoriteButton: UIButton!
  

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  }

}
