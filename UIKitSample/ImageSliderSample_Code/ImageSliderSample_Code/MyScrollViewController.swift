//
//  MyScrollViewController.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/03/29.
//
//참고 //https://www.hohyeonmoon.com/blog/swift-scrollview-programmatically/
import UIKit
class MyScrollViewController : UIViewController{
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = "Scroll Bottom"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .blue
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
          self.view.addSubview(scrollView)

          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
          scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

          scrollView.addSubview(labelOne)

          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

          scrollView.addSubview(labelTwo)

          labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
          labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
          labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
    }
}
