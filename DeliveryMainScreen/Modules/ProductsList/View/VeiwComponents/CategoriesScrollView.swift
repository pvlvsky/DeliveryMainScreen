//
//  CategoriesScrollView.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

class CategoriesScrollView: UIScrollView {
    var tabs: [CategoriesCustomButton] = []
    
    required init(items: [String]) {
        super.init(frame: .zero)
        configure(items: items)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        tabs.forEach { $0.addTarget(target, action: action, for: .touchUpInside) }
    }
}

extension CategoriesScrollView {
    
    func configure(items: [String]) {
        tabs = items.map { CategoriesCustomButton(title: $0) }
                        
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        let spacingRightView = UIView()
        stackView.addArrangedSubview(spacingRightView)
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        addSubview(stackView)
                
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            spacingRightView.widthAnchor.constraint(equalToConstant: 8),
        ])
        
        guard let fistTab = tabs.first else { return }
        fistTab.isSelected = true
        
        NSLayoutConstraint.activate([
            fistTab.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
        ])
    }
}
