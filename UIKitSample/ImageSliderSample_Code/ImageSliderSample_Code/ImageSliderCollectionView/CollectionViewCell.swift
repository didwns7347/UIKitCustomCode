//
//  CollectionViewCell.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/04/02.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    lazy var imageView : UIImageView  = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .brown
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUplaout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CollectionViewCell{
    private func setUplaout(){
        self.backgroundColor = .brown
        self.addSubview(imageView)
        let cons = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(cons)
    }
}
