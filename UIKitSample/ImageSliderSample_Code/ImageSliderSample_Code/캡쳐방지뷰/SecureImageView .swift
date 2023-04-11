//
//  SecureImageView .swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/04/10.
//

import UIKit
class SecureImageView: UIView {
    var name: String = "" {
        didSet{
            DispatchQueue.main.async {
                self.imageView.image = UIImage(named: self.name) ?? UIImage(systemName: "photo.artframe")
       
                let field = UITextField()
                field.isSecureTextEntry = true
                self.imageView.addSubview(field)

                self.imageView.layer.superlayer?.addSublayer(field.layer)
                field.layer.sublayers?.first?.addSublayer(self.imageView.layer)
            }

        }
    }
    
    @objc var url: String = "" {
        didSet {
            
            var image: UIImage!
            DispatchQueue.global().async {
                guard let url = URL(string: self.url) else { return }
                
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    image = UIImage(data: data!)
                    self.imageView.image = image
                    
                    //                let imageWidth = image!.size.width
                    //                let imageHeight = image!.size.height
                    
                    let field = UITextField()
                    field.isSecureTextEntry = true
                    self.imageView.addSubview(field)

                    self.imageView.layer.superlayer?.addSublayer(field.layer)
                    field.layer.sublayers?.first?.addSublayer(self.imageView.layer)
                }
            }
            
            
        }
    }
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        let cons = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(cons)
//        self.makeSecure()
    }
}
