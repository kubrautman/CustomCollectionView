//
//  VideoCell.swift
//  LetsBuildApp
//
//  Created by Kub on 18.12.2018.
//  Copyright © 2018 Kub. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "taylor")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds=false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taylorProfile" )
        imageView.layer.cornerRadius=22
        imageView.layer.masksToBounds=true
        return imageView
    }()
    let seperatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.blue
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        return view
    }()
    let titleLabel : UILabel = {
        let label=UILabel()
        label.text="Taylor Swift-Blank Space"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subtitleTextView : UITextView = {
        let textView=UITextView()
        textView.text="TaylorSwiftVEVO + 1,604,684,687 2 years"
        textView.textContainerInset=UIEdgeInsetsMake(0, -4, 0, 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor=UIColor.lightGray
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
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        
        //left constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView ,attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView ,attribute: .right, multiplier: 1, constant: 0))
        //height constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        //addConstrainsWithFormat(format: "V:[v0(20)]", views: titleLabel)
        //addConstrainsWithFormat(format: "H:|[v0]|", views: titleLabel)
        //thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) hasnot been implemented")
    }
}

