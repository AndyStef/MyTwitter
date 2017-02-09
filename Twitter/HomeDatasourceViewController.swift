//
//  HomeDatasourceViewController.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceViewController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarItems()
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        Service.sharedInstance.fetchHomeFeed { homeDataSource in
            self.datasource = homeDataSource
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    private func setupNavigationBarItems() {
        setupLeftNavItems()
        setupRightNavItems()
        setupRemainingThings()
    }

    private func setupRemainingThings() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        let navSeparatorView = UIView()
        navSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navSeparatorView)
        navSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)

        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "twitter-logo"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }

    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }

    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search-icon"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)

        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose-icon"), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)

        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }

        return CGSize(width: view.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }

        return CGSize(width: view.frame.width, height: 64)
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = datasource?.item(indexPath) as? User {
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2

            //height needs to be very large
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }

        return CGSize(width: view.frame.width, height: 200)
    }

    //MARK: Used to remove gap between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
