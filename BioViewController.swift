//
//  BioViewController.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {
    
    var bio = Bio()
    
    lazy var backgroundImage: Backgrounds = {
        let imageView = Backgrounds(image: #imageLiteral(resourceName: "marsbackground5"))
        return imageView
    } ()
    
    lazy var storyLabel: UILabel = {
        let label  = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 16.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.masksToBounds = false
        
        return label
    }()
    
    let textBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
        image.layer.cornerRadius = 20
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.title = "About Mars Argo"
        
        
        storyLabel.text = bio.bioText()        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
        
        view.addSubview(textBackground)
        
        NSLayoutConstraint.activate([
            textBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14.0),
            textBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14.0),
            textBackground.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -180.0),
            textBackground.heightAnchor.constraint(equalToConstant: 400),
            ])
        
        view.addSubview(storyLabel)
        
        NSLayoutConstraint.activate([
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22.0),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22.0),
            storyLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -165.0),
            ])
        
    }
}

