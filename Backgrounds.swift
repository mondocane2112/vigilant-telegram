//
//  Backgrounds.swift
//  MarsArgo
//
//  Created by Dude Bro Dude on 3/31/18.
//  Copyright © 2018 Dude Bro Dude. All rights reserved.
//

import Foundation
import UIKit

class Backgrounds: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }
    
}

