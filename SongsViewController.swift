//
//  SongsViewController.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import UIKit
import AVFoundation

class SongsViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    lazy var backgroundImage: Backgrounds = {
        let imageView = Backgrounds(image: #imageLiteral(resourceName: "marsbackground3"))
        /*imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.image = #imageLiteral(resourceName: "marsargobackground3")
         imageView.contentMode = .scaleAspectFit*/
        return imageView
    } ()
    
    lazy var usingYouButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("Using You", for: .normal)
        button.addTarget(self, action: #selector(usingYouAction), for: .touchUpInside)
        return button
    } ()
    
    lazy var runawayButton: MenuButton  = {
        let button = MenuButton(type: .system)
        button.setTitle("Runaway Runaway", for: .normal)
        button.addTarget(self, action: #selector(runawayPlayback), for: .touchUpInside)
        return button
    } ()
    
    lazy var lovebwButton: MenuButton = {
        let button = MenuButton(type: .system)
        button.setTitle("Love In Black and White", for: .normal)
        button.addTarget(self, action: #selector(lovebwPlayback), for: .touchUpInside)
        return button
    } ()
    
    func playSong(withName name: SongNames) {
        guard let path = Bundle.main.path(forResource: name.rawValue, ofType: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer.play()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        //Do whatever you want here
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Songs"
        
    }
    
    @objc func usingYouAction(sender: UIButton! ) {
        playSong(withName: .usingyou)
    }
    
    @objc func runawayPlayback(sender: UIButton! ) {
        playSong(withName: .runaway)
    }
    
    @objc func lovebwPlayback(sender: UIButton! ) {
        playSong(withName: .loveblackwhite)
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
            usingYouButton: -70,
            runawayButton: 0,
            lovebwButton: 70,
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
