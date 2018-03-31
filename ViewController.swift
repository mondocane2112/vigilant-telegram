//
//  ViewController.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var backgroundImage: Backgrounds = {
        let imageView = Backgrounds(image: #imageLiteral(resourceName: "marsbackground"))
        return imageView
    } ()
    
    lazy var welcomeButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("Welcome", for: .normal)
        button.addTarget(self, action: #selector(welcomeAction), for: .touchUpInside)
        return button
    } ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setup() {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc func welcomeAction() {
        
        let menuVC = MenuViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.view.addSubview(backgroundImage)
        self.view.addSubview(welcomeButton)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            welcomeButton.heightAnchor.constraint(equalToConstant: 40),
            welcomeButton.widthAnchor.constraint(equalToConstant: 200),
            welcomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80 )
            ])
    }
    
    
}

