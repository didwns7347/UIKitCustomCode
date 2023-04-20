//
//  CapturePreventViewController.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/04/10.
//

import UIKit

class CapturePreventViewController : UIViewController{
    let imageView : SecureImageView = SecureImageView(frame: .zero)
    
    let myLabel : UILabel = {
        let label = UILabel()
        label.text = "캡쳐방지 이미지"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(myLabel)
        view.backgroundColor = .systemBackground

        imageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let cons = [
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(cons)
        
        let labelcons = [
            myLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            myLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10),
            myLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            myLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(labelcons)
        
//        imageView.url = "https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/86/3a/87/863a87b0-5f65-449d-bb60-5dc9f96c690d/482253f1-b9b2-4e57-a7e0-b8e331bafe8f_ios_5.5_Ud615_10__Ub0b4_Ud3f0_Uc2dc_Uc138_opaque.png/392x696bb.png"
        imageView.name = "SwiftUI"
    }
    
    
}

extension UIView {
    func makeSecure() {
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
}
