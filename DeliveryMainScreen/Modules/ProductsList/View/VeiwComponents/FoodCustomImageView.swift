//
//  FoodCustomImageView.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

class FoodCustomImageView: UIImageView {
    
    init(size: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBorderShape()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupBorderShape() {
        let width = bounds.size.width
        layer.cornerRadius = width / 2
    }
}

