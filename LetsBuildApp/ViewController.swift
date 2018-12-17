//
//  ViewController.swift
//  LetsBuildApp
//
//  Created by Kub on 17.12.2018.
//  Copyright © 2018 Kub. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      navigationItem.title="Home"
       collectionView?.backgroundColor=UIColor.white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width), height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   }

    class VideoCell: UICollectionViewCell{
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        let thumbnailImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.blue
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        func setupViews()
        {
            addSubview(thumbnailImageView)
          
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
            thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) hasnot been implemented")
        }
 
}






    

  
   




