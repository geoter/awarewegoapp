//
//  NotificationsViewController.swift
//  awarewego
//
//  Created by awarewego on 29/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class NotificationsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(red: 68/255.0, green: 79/255.0, blue: 99/255.0, alpha: 1.0)]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 25
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = (indexPath.row%2==0) ? "NotificationCell":"NotificationCell2"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NotificationCell
        // Configure the cell...
        cell.descriptionLabel.text = (indexPath.row%2 != 0) ? "You earned 30 points":"fjkweiwayfiwegfgwigfwegygfygwyegfywegufgwegfuguewqgygfugoqweyugfygqewfygweygfigqwiyiygfiyqwgegifgoiqwegfiwqeifgiygqweiyfgiywqegfgqiweygfyiqwegfiyyqwgeifqw"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
