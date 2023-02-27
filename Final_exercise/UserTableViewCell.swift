//
//  UserTableViewCell.swift
//  Final_exercise
//
//  Created by VIETLAMTR on 26/02/2566 BE.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var link: UITextView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepare(user: User) {
        link.text = user.html_url
        avatar.image = UIImage(url: URL(string: user.avatar_url))
        name.text = user.login
    }

}

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
