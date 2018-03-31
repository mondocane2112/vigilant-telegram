//
//  MenuViewController.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    lazy var backgroundImage: Backgrounds = {
        let imageView = Backgrounds(image: #imageLiteral(resourceName: "marsbackground2"))
        return imageView
    } ()
    
    lazy var bioButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("About Mars Argo", for: .normal)
        button.addTarget(self, action: #selector(bioButtonAction), for: .touchUpInside)
        return button
    } ()
    
    lazy var songsButton: MenuButton  = {
        let button = MenuButton(type: .system)
        button.setTitle("Songs", for: .normal)
        button.addTarget(self, action: #selector(songsButtonAction), for: .touchUpInside)
        return button
    } ()
    
    let socmedButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("Social Media", for: .normal)
        button.addTarget(self, action: #selector(smButtonAction), for: .touchUpInside)
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Navigation Buttons Functions
    @objc func bioButtonAction() {
        let bioVC = BioViewController( )
        self.navigationController?.pushViewController(bioVC, animated: true)
    }
    
    @objc func songsButtonAction() {
        let songsVC = SongsViewController()
        self.navigationController?.pushViewController(songsVC, animated: true)
    }
    
    @objc func smButtonAction() {
        let smVC = SMViewController()
        self.navigationController?.pushViewController(smVC, animated: true)
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
        
        let constraintData: [UIView: CGFloat] = [
            bioButton: -70,
            songsButton: 0,
            socmedButton: 70,
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

