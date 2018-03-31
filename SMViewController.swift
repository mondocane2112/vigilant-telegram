//
//  SMViewController.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import UIKit

class SMViewController: UIViewController {
    
    lazy var backgroundImage: Backgrounds = {
        let imageView = Backgrounds(image: #imageLiteral(resourceName: "marsbackground4"))
        return imageView
    } ()
    
    
    let marsTwitterButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("Mars' Twitter", for: .normal)
        button.addTarget(self, action: #selector(marsTwitterAction), for: .touchUpInside)
        return button
    } ()
    
    let titanicTwitterButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("Titanic's Twitter", for: .normal)
        button.addTarget(self, action: #selector(titanicTwitterAction), for: .touchUpInside)
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Social Media"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func marsTwitterAction(sender: UIButton! ) {
        if let url = URL(string: "https://twitter.com/marsargo") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @objc func titanicTwitterAction(sender: UIButton! ) {
        if let url = URL(string: "https://twitter.com/titanicsinclair") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func viewWillLayoutSubviews() {
        
        self.view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor)
            ])
        
        
        let constraintData: [UIView: CGFloat] = [
            marsTwitterButton: -70,
            titanicTwitterButton: 0,
            ]
        
        for (v, constant) in constraintData {
            self.view.addSubview(v)
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 40),
                v.widthAnchor.constraint(equalToConstant: 200),
                v.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                v.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
                ])
        }
    }
}

