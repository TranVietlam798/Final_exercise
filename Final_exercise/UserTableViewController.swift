//
//  UserTableViewController.swift
//  Final_exercise
//
//  Created by VIETLAMTR on 26/02/2566 BE.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var users = [User]()
    var detail: Detail!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! UserDetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        
        let user = users[row]
        vc.user = user
    
    }
    
    
    func loadData () {
        APIHandler.sharedInstance.fetchDataListUser{ [self] apiData in
            users = apiData
            tableView.reloadData()
        }
    }
    // MARK: - Table view data source

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let viewcontroller = segue.destination as! UserDetailViewController
//        guard let row = tableView.indexPathForSelectedRow?.row else {return}
//        let user  = users[row]
//        print("aaaaaaaa",user)
//        APIHandler.sharedInstance.fetchDataListUserDetail(login: user.login){ [self] apiData in
//            detail = apiData
//            tableView.reloadData()
//        }
//        viewcontroller.user = user
//
//
//    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count  }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell

        let row  = users[indexPath.row]
        cell.prepare(user: row)

        return cell
    }
    
//    func pushDetailViewForUser(withId id: User.ID) {
//        guard let row = tableView.indexPathForSelectedRow?.row else {return}
//        let user  = users[row]
//
//        let user = user(withId: id)
//        print("aaaaa", user)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "userDetail") as? UserDetailViewController
//        viewController?.user = user
//        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
