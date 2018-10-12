//
//  DataItemHeaderCollectionReusableView.swift
//  Test Collection View
//
//  Created by Saad Platini on 11.10.18.
//  Copyright © 2018 Saad Platini. All rights reserved.
//

import UIKit

class DataItemHeader: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
           
        
        }
    }
    
}
