//
//  SearchResultsTableVC.swift
//  awarewego
//
//  Created by awarewego on 02/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class SearchResultsTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        let headerNib = UINib.init(nibName: "SectionCategoryHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "SectionCategoryHeader")
    }
    
       override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionCategoryHeader") as! SectionCategoryHeader
//
//        headerView.titleLabel.text = "Search results"
//
//        return headerView
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let containerView:UIView = UIView()
        
        let bgView:UIView = UIView()
        bgView.layer.cornerRadius = 10
        bgView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9725490196, alpha: 1)
        containerView.addSubview(bgView)
       
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        bgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        bgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        let label:UILabel = UILabel()
        bgView.addSubview(label)
        label.text = "Missions in"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Medium", size: 18)
        
        label.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10).isActive = true
        
        return containerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! SearchResultCell

        cell.resultText = "Paris"

        return cell
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

extension SearchResultsTableVC: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      //let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
      //filterContentForSearchText(searchController.searchBar.text!, scope: scope)
        tableView.reloadData()
    }
}

extension SearchResultsTableVC: UISearchControllerDelegate{
    func willPresentSearchController(_ searchController: UISearchController) {
        //fetch recommendations based on location
        print("will show recommendations")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        print("did show recommendations")
    }
    
}
