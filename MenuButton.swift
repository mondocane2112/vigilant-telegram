//
//  MenuButton.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import Foundation
import UIKit

class MenuButton: UIButton {
    
    let fontTitleColor = UIColor.white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        
        self.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height/2
        self.setTitleColor(fontTitleColor, for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
}
