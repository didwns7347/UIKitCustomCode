//
//  ImageSliderView.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/03/29.
//

import UIKit
class ImageSliderView : UIView{
    let imageULRs : [String]!

    
    //스크롤뷰
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    init(frame: CGRect, imageURLs:[String]) {
        self.imageULRs = imageURLs
        super.init(frame: frame)
        
    }
    
    func setUpImage(){
        self.backgroundColor = .blue
        setUpSlider()
        addImages()
    }
    
    private func setUpSlider() {
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollCons = [
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
        ]
        NSLayoutConstraint.activate(scrollCons)
        //이걸 실행해야 오토레이아웃이 적용된 후의 사이즈를 구할수 있음.아니면 0.0으로나옴
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    private func addImages(){
        let offset:CGFloat = 16.0
        //화면에 오프셋 + 이미지길이 + 오프셋 + 다음이미지 절반을 나타내기위한 넓이 조절
        let width: CGFloat = (scrollView.frame.width - offset - offset) / 3.0 * 2.0
        //높이는 스크롤뷰에 맞춤
        let height: CGFloat = (scrollView.frame.height)
        
        for (i,urlString) in imageULRs.enumerated(){
            //이미지가 배치될 x좌표 구하기 0을 기준으로 i가증가함에 따라 구함.
            let x:CGFloat = offset*CGFloat(i+1) + width * CGFloat(i)
            print(width,height,x)
            let imageView = UIImageView()
            imageView.backgroundColor = .secondarySystemBackground
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            scrollView.addSubview(imageView)
            
            let cons = [
                imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: x),
                imageView.widthAnchor.constraint(equalToConstant: width),
                imageView.heightAnchor.constraint(equalToConstant: height),
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor)
            ]
            NSLayoutConstraint.activate(cons)
            //이미지 가져오기 코드 라이브러리 추가하기 귀찮아서 직접구현
            DispatchQueue.global().async {
                guard let url = URL(string: urlString) else {return}
                let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data!)
                }
            }
        }
        //스크롤뷰의 컨텐츠 사이즈를 넣어줘야 스크롤이가능함.
        scrollView.contentSize = CGSize(
            width: (offset+width) * CGFloat(imageULRs.count),
            height: height
        )
 
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
