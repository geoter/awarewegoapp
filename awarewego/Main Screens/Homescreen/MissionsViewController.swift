//
//  MissionsViewController.swift
//  awarewego
//
//  Created by awarewego on 30/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MissionCell"

class MissionsViewController: UITableViewController{

    typealias Datasource = UITableViewDiffableDataSource<Section, MissionCellViewModel>
    
    @IBOutlet weak var missionsTableView: UITableView!
     
    fileprivate var dataSource: Datasource!
    
    lazy var searchResultsVC:SearchResultsTableVC = {
        return self.storyboard!.instantiateViewController(identifier: "SearchResultsTableVC")
    }()
    
    var searchController:UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMissionsTableView()
        
        let recommendationsVC:SearchRecommendationsVC = self.storyboard!.instantiateViewController(identifier: "SearchRecommendationsVC")
        //searchController = UISearchController(searchResultsController: searchResultsVC)
        searchController = UIRecommendSearchController(searchResultsController: searchResultsVC,recommendViewController: recommendationsVC)
        
        // Setup the Search Controller
        searchController.delegate = searchResultsVC
        searchController.searchResultsUpdater = searchResultsVC
        searchController.searchBar.placeholder = "Search for a landmark or city"
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = true
        //navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(red: 68/255.0, green: 79/255.0, blue: 99/255.0, alpha: 1.0)]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadMissionsViewModels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let filtersScrollVC = destination as? FiltersScrollVC {
          filtersScrollVC.delegate = self
        }
    }
    
    @IBAction func unwindToMissions(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        
    }

}

// MARK: - Data source: missionsTableView
extension MissionsViewController{
    
    func loadMissionsViewModels(){
        let missions:[MissionsDataLayer.Mission] = MissionsDataLayer.getMissions()
        let missionsModelViews = missions.map { (mission) -> MissionCellViewModel in
            return MissionCellViewModel(with: mission)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, MissionCellViewModel>()
        snapshot.appendSections([.nearby])
        snapshot.appendItems(missionsModelViews,toSection: .nearby)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureMissionsTableView(){
        let nib = UINib(nibName: "MissionTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MissionCell")
        
        let headerNib = UINib.init(nibName: "SectionCategoryHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "SectionCategoryHeader")
        
        configureDataSource()
    }
    
    func configureDataSource() {
        dataSource = Datasource(tableView: self.missionsTableView) {
                (tableView: UITableView, indexPath: IndexPath,
                missionViewModel: MissionCellViewModel) -> MissionTableViewCell? in
            
                let missionCell = tableView.dequeueReusableCell(
                    withIdentifier: reuseIdentifier, for: indexPath) as! MissionTableViewCell
                missionCell.configureCell(viewModel: missionViewModel)
                return missionCell
        }
    }
}

// MARK: - Delegate: missionsTableView
extension MissionsViewController{
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionCategoryHeader") as! SectionCategoryHeader
        
        headerView.titleLabel.text = "Nearby"
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(SectionCategoryHeader.headerHeight)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MissionsStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MissionInfoVC")
         self.present(vc, animated: true, completion: nil)
    }
}

enum Section: CaseIterable {
     case active
     case nearby
}

extension MissionsViewController:FiltersScrollDelegate{
    func showFilters() {
        self.performSegue(withIdentifier: "showFilters", sender: nil)
    }
}

