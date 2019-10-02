//
//  MissionsViewController.swift
//  awarewego
//
//  Created by awarewego on 30/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MissionCell"

class MissionsViewController: UITableViewController {

    typealias Datasource = UITableViewDiffableDataSource<Section, MissionCellViewModel>
    
    @IBOutlet weak var missionsTableView: UITableView!
     
    fileprivate var dataSource: Datasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMissionsTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(red: 68/255.0, green: 79/255.0, blue: 99/255.0, alpha: 1.0)]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadMissionsViewModels()
    }
    
    /*


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        
        let headerNib = UINib.init(nibName: "MissionsCategoryHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "MissionsCategoryHeader")
        
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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MissionsCategoryHeader") as! MissionsCategoryHeader
        
        headerView.titleLabel.text = "Nearby"
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(MissionsCategoryHeader.headerHeight)
    }
}

enum Section: CaseIterable {
     case active
     case nearby
}
