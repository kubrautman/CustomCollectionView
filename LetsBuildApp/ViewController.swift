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
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
        
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideoCell
        
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
        imageView.image = UIImage(named: "taylor")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        
        return view
    }()
    let titleLabel : UILabel = {
        let label=UILabel()
        label.backgroundColor=UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subtitleTextView : UITextView = {
        let textView=UITextView()
        textView.backgroundColor=UIColor.red
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func setupViews()
    {
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView,"v1" :seperatorView ]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : seperatorView]))
        
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView,seperatorView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: seperatorView)
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        //top constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        //left constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView ,attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView ,attribute: .right, multiplier: 1, constant: 0))
        //height constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //top constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        //left constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView ,attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView ,attribute: .right, multiplier: 1, constant: 0))
        //height constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        //addConstrainsWithFormat(format: "V:[v0(20)]", views: titleLabel)
        //addConstrainsWithFormat(format: "H:|[v0]|", views: titleLabel)
        //thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) hasnot been implemented")
    }
}
extension UIView {
    func addConstrainsWithFormat(format:String, views : UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index,view) in views.enumerated(){
            let key="v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics:  nil, views: viewsDictionary ))
        
    }
    
}














