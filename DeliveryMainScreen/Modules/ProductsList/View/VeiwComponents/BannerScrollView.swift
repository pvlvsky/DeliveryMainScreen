//
//  BannerScrollView.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

class BannerScrollView: UIScrollView {
    var items: [UIImageView] = []
    
    required init(urls: [String]) {
        super.init(frame: .zero)
        configure(urls: urls)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannerScrollView {
    func configure(urls: [String]) {
        items = urls.map { url in
            let imageView = UIImageView()
            imageView.image = UIImage(named: url)
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 112),
                imageView.widthAnchor.constraint(equalToConstant: 300)
            ])
            return imageView
        }
                        
        let stackView = UIStackView(arrangedSubviews: items)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        
        let spacingRightView = UIView()
        stackView.addArrangedSubview(spacingRightView)
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        addSubview(stackView)
                
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        guard let fistTab = items.first else { return }
        
        NSLayoutConstraint.activate([
            fistTab.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
        ])
    }
}
