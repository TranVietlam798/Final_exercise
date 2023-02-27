//
//  UserDetailViewController.swift
//  Final_exercise
//
//  Created by VIETLAMTR on 27/02/2566 BE.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var decription: UITextView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
    var detail: Detail!
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("aaaaaaaa",user)
        APIHandler.sharedInstance.fetchDataListUserDetail(login: user.login){ [self] apiData in
            detail = apiData
//            imageUser?.image = UIImage(url: URL(string: user.avatar_url))
//            name?.text = user.login
//            decription?.text = user.html_url
            imageUser?.image = UIImage(url: URL(string: detail.avatar_url))
            name?.text = detail.name
            decription?.text = detail.email
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
