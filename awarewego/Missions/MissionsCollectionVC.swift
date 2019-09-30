//
//  MissionsCollectionVC.swift
//  awarewego
//
//  Created by awarewego on 27/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MissionCell"

class MissionsCollectionVC: UICollectionViewController {
    
    enum Section: CaseIterable {
        case header
        case active
        case nearby
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, MissionCellViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "MissionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MissionCell")
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(UINib(nibName: "MissionsCategoryHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MissionsCategoryHeader.reuseIdentifier)
        collectionView.register(UINib(nibName: "CollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.reuseIdentifier)
        
        configureDataSource()
        configureHeader()
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
            <Section, MissionCellViewModel>(collectionView: self.collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath,
                missionViewModel: MissionCellViewModel) -> MissionCollectionViewCell? in
            
                let missionCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath) as! MissionCollectionViewCell
                missionCell.backgroundColor = UIColor.blue
                missionCell.configureCell(viewModel: missionViewModel)
                return missionCell
        }
    }

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
    
//    func loadFilters(){
//        let filters:[FiltersDataModel.Filter] = FiltersDataModel.getFilters()
//        let filtersModelViews = filters.map { (filter) -> FilterCellViewModel in
//            return FilterCellViewModel(with: filter)
//        }
//        var snapshot = NSDiffableDataSourceSnapshot<Section, FilterCellViewModel>()
//        snapshot.appendSections([.header])
//        snapshot.appendItems(filtersModelViews,toSection: .header)
//        dataSource.apply(snapshot, animatingDifferences: false)
//    }
}

extension MissionsCollectionVC { //Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let identifier = dataSource.itemIdentifier(for: indexPath){
            print("cell selected:\(identifier)")
        }
    }
}

extension MissionsCollectionVC{
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalWidth(100/80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let groupSize = itemSize
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(32))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind:  UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func createLayout2() -> UICollectionViewLayout {
           
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .fractionalWidth(100/80))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

            let groupSize = itemSize
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
            subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)

            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(32))

            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind:  UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
           
           return section
        }
        return layout
    }
    
    func configureHeader() {
           dataSource?.supplementaryViewProvider = { (
               collectionView: UICollectionView,
               kind: String,
               indexPath: IndexPath) -> UICollectionReusableView? in
            
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MissionsCategoryHeader.reuseIdentifier, for: indexPath) as? MissionsCategoryHeader{
                header.titleLabel.text = "Nearby"
                return header
            }
               return nil
           }
       }
}

