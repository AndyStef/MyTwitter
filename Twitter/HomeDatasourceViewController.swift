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

    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies, something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA component

        setupNavigationBarItems()
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        Service.sharedInstance.fetchHomeFeed { (homeDataSource, error) in
            if let error = error {
                self.errorMessageLabel.isHidden = false
                if let apiError = error as? APIError<Service.JSONError> {
                    if  apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }

                return
            }

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
        
        if indexPath.section == 0 {
            guard let user = datasource?.item(indexPath) as? User else { return .zero}
            let estimatedHeight = estimateHeightForText(user.bioText)
                
            return CGSize(width: view.frame.width, height: estimatedHeight  + 66)
            
        } else if indexPath.section == 1 {
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            let estimatedHeight = estimateHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }

        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimateHeightForText(_ text: String) -> CGFloat {
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
    }

    //MARK: Used to remove gap between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
