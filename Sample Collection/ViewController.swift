//
//  ViewController.swift
//  Sample Collection
//
//  Created by Bright Ahedor on 24/07/2017.
//  Copyright © 2017 Flippy Campus Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var testUICollectionView: UICollectionView!
     var feed = [AnyObject]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        //register cell
        self.testUICollectionView.register(UINib(nibName: "FeedTwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeedTwoCollectionViewCell")
        
        self.testUICollectionView.register(UINib(nibName: "FeedOneCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeedOneCollectionViewCell")
        
        
        
        let user = FeedTwo()
        let post = FeedOne()
        
        feed.append(user)
        feed.append(post)
        feed.append(user)
        feed.append(post)
        feed.append(user)
        feed.append(post)
        feed.insert(user, at: 1)
        
        self.testUICollectionView.reloadData()
        
        
        
    }


    
    //MARK:- collection view delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(2.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(2.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(2.0), left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let feedObject = self.feed[indexPath.row]
        var height = 0
        
        if feedObject is FeedOne {
            height = 200
        } else {
            height = 100
        }
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let contentWidth = collectionView.bounds.width
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(1 - 1))
        let size = Int((contentWidth - totalSpace) / CGFloat(1))
        
        
        return CGSize(width: size, height: Int(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let feedObject = self.feed[indexPath.row]
        //moment
        if feedObject is FeedOne {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedOneCollectionViewCell", for: indexPath) as! FeedOneCollectionViewCell
            
            
            cell.backgroundColor = UIColor.red
            
            return cell
            //ad
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedTwoCollectionViewCell", for: indexPath) as! FeedTwoCollectionViewCell
            
            
            cell.backgroundColor = UIColor.blue
            return cell
            
        }
        
    }
    

    

}

