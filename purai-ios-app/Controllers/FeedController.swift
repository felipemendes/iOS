//
//  ViewController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 15/10/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let comingCellId = "comingCellId"
    let spotlightCellId = "spotlightCellId"
    let todayCellId = "todayCellId"
    let categoryCellId = "categoryCellId"
    
    let titles = [
        "Próximos eventos",
        "Destaques",
        "Hoje",
        "Categorias"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
    }
    
     override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupNavBar() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Próximos eventos"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = .rgb(red: 23, green: 25, blue: 29)
        
        collectionView?.register(ComingCell.self, forCellWithReuseIdentifier: comingCellId)
        collectionView?.register(SpotlightCell.self, forCellWithReuseIdentifier: spotlightCellId)
        collectionView?.register(TodayCell.self, forCellWithReuseIdentifier: todayCellId)
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        collectionView.isPagingEnabled = true
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))

        let moreImage = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    
    func scrollTo(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        setTitleForIndex(index: menuIndex)
    }
    
    private func setTitleForIndex(index: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = titles[index]
        }
    }
    
    @objc func handleSearch() {
        print("search")
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore() {
        settingsLauncher.showSettings()
    }
    
    func showDetailController(for event: Event) {
        let viewController = DetailController()
//        let viewController = DetailController(collectionViewLayout: UICollectionViewFlowLayout())
        viewController.event = event
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showControllerForSetting(_ setting: Setting) {
        let dummySettingViewController = UIViewController()
        dummySettingViewController.view.backgroundColor = .rgb(red: 23, green: 25, blue: 29)
        dummySettingViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.pushViewController(dummySettingViewController, animated: true)
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    private func setupMenuBar() {
//        navigationController?.hidesBarsOnSwipe = true
        
        let blackView = UIView()
        blackView.backgroundColor = UIColor.rgb(red: 23, green: 25, blue: 29)
        view.addSubview(blackView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: blackView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: blackView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        let guide = view.safeAreaLayoutGuide
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        setTitleForIndex(index: Int(index))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        
        switch indexPath.item {
        case 1:
            identifier = spotlightCellId
        case 2:
            identifier = todayCellId
        case 3:
            identifier = categoryCellId
        default:
            identifier = comingCellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FeedCell
        cell.homeController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }

}
