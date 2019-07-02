//
//  TimeLineCollectionViewCell.swift
//  Instagram
//
//  Created by Thiago B Claramunt on 02/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class TimeLineCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

