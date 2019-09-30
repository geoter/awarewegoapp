//
//  MissionsViewController.swift
//  awarewego
//
//  Created by awarewego on 30/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MissionCell"

class MissionsViewController: UIViewController {

    @IBOutlet weak var missionsCollectionView: UICollectionView!
    
    enum Section: CaseIterable {
         case active
         case nearby
     }
     
    fileprivate var dataSource: UICollectionViewDiffableDataSource<Section, MissionCellViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMissionsCollectionView()
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

// MARK: - Datasource: MissionsCollectionView
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
    
    func configureMissionsCollectionView(){

        missionsCollectionView.collectionViewLayout = createLayout()
        
        missionsCollectionView.register(UINib(nibName: "MissionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MissionCell")
        missionsCollectionView.register(UINib(nibName: "MissionsCategoryHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MissionsCategoryHeader.reuseIdentifier)
        
        configureDataSource()
        configureHeaders()
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
            <Section, MissionCellViewModel>(collectionView: self.missionsCollectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath,
                missionViewModel: MissionCellViewModel) -> MissionCollectionViewCell? in
            
                let missionCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier, for: indexPath) as! MissionCollectionViewCell
                missionCell.backgroundColor = UIColor.blue
                missionCell.configureCell(viewModel: missionViewModel)
                return missionCell
        }
    }
    
    private func configureHeaders() {
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
        
}

