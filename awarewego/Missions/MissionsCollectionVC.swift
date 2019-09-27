//
//  MissionsCollectionVC.swift
//  awarewego
//
//  Created by awarewego on 27/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MissionsCollectionVC: UICollectionViewController {
    
    enum Section: CaseIterable {
        case active
        case nearby
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, MissionCellModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMissionsViewModels()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

extension MissionsCollectionVC { //Datasource
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
            <Section, MissionCellModel>(collectionView: self.collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath,
                mountain: MissionCellModel) -> UICollectionViewCell? in
            
                let missionCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath)
                    
                return missionCell
        }
    }

    func loadMissionsViewModels(){
        let missions:[MissionsDataLayer.Mission] = MissionsDataLayer.getMissions()
        let missionsMovelViews = missions.map { (mission) -> MissionCellModel in
            return MissionCellModel(with: mission)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, MissionCellModel>()
        snapshot.appendSections([.nearby])
        snapshot.appendItems(missionsMovelViews)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension MissionsCollectionVC { //Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let identifier = dataSource.itemIdentifier(for: indexPath){
            print("cell selected:\(identifier)")
        }
    }
}
