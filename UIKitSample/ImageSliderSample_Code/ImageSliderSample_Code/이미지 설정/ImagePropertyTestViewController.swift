//
//  ImagePropertyTestViewController.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/04/20.
//

import UIKit

class ImagePropertyTestViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.clipsToBounds = false //넘치기 허용
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let emptyView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let testView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(emptyView)
        emptyView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        emptyView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        emptyView.widthAnchor.constraint(equalToConstant:  300).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        emptyView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant:  200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.image = UIImage(named: "SwiftUI")
        
//        emptyView.addSubview(testView)
//        testView.topAnchor.constraint(equalTo: emptyView.topAnchor , constant: 100).isActive = true
//        testView.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor , constant: 100).isActive = true
//        testView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        testView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    

}
/**
 Fit : 이미지가 뷰에 안꽉참
 Fill: 이미지가 뷰에 꽉참.
 scale to fill = 원본 비율은 무시하고 imageview에 꽉차도록 표시함. (200*400 사이즈에 비율을 무시하고 채움.)
 aspectfit = 원본 비율을 유지한체 이미지를 체움 화면 다못채우는 경우발생 (200*200 으로 채움.)
 aspectFill = 비율유지하고 이미지를 꽉차게함. 화면 넘침 ()
 */
