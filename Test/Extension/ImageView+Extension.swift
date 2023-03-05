//
//  ImageView+Extension.swift
//  Test
//
//  Created by Prachit on 05/03/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageView(_ imageUrl : String) {
        guard let url = URL(string: imageUrl) else { return }
      
        let resources = ImageResource(downloadURL: url,cacheKey: imageUrl)
        kf.indicatorType = .activity
        kf.setImage(with: resources)
    }
    
}
