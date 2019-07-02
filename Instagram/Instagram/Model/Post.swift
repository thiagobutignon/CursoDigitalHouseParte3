//
//  Post.swift
//  Instagram
//
//  Created by Thiago B Claramunt on 02/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var name: String?
    var comments: String?
    var image: UIImage?
    
    init(name: String?, comments: String?, image: UIImage?) {
        self.name = name
        self.comments = comments
        self.image = image
    }
}
