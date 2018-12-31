//
//  FeedCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 17/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var baseController: BaseController?
    var events: [Event]?
    var category: Category?
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .dark
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    func fetchEvents() {
        
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: cellId)
        
        NetworkManager.isReachable { _ in
            self.fetchEvents()
        }
        
        NetworkManager.isUnreachable { _ in
            self.messageLabel.text = localized("no_internet_connection")
            self.addSubview(self.messageLabel)
            self.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: self.messageLabel)
            self.addConstraintsWithFormat(format: "V:|[v0]|", views: self.messageLabel)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.events?.count == nil {
            SpinnerController.sharedInstance.showSpinner()
        } else {
            SpinnerController.sharedInstance.removeSpinner()
        }

        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! EventCell
        cell.event = events?[indexPath.item]
        
        let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: collectionView)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 12 / 16
        return CGSize(width: frame.width, height: height + 16 + 76)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.baseController?.showDetailController(for: (events?[indexPath.item])!, at: indexPath, of: collectionView)
    }
}
