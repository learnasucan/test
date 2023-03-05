//
//  ProductCell.swift
//  Test
//
//  Created by Prachit on 05/03/23.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration() {
        guard let product else { return }
        
        titleLabel.text = product.title
        priceLabel.text = "$ \(product.price)"
        descriptionLabel.text = product.description
        categoryLabel.text = product.category
        ratingButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImageView(product.image)
        
    }
    
}

