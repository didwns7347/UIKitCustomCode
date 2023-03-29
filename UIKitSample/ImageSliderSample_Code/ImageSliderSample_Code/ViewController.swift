//
//  ViewController.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/03/29.
//

import UIKit

class ViewController: UIViewController {
    //테스트용 이미지
    private let dummyURLs = [
        "https://is2-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/75/7d/c5/757dc535-c6a1-f01d-ec2f-39e73acc0bc2/6ab62f8a-f15f-4ece-8555-e2c70bf5e28d_ios_5.5_Ud615_01__Uba54_Uc778_opaque.png/392x696bb.png",
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/65/56/eb/6556eb7a-026e-6ca5-572c-a2939551649a/ad11b8f7-aa76-4ece-866f-dfaf3960cfef_ios_5.5_Ud615_02__Uc774_Ubca4_Ud2b8_opaque.png/392x696bb.png",
        "https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/6d/84/02/6d840288-e6e8-a893-8599-7db8f2c6b282/0610b479-0718-49a1-91bd-2e1f1ac6ebc7_ios_5.5_Ud615_03__Uc804_Uad6d_Uad6c_Uc911_Uace0_Uac70_Ub798_opaque.png/392x696bb.png",
        "https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/f0/19/74/f0197497-47bd-76a3-9a3d-78e371b0e277/68b9cce1-0891-49d4-b633-1bb726a7546a_ios_5.5_Ud615_04__Ube0c_Ub79c_Ub4dc__Uc911_Uace0_Uac70_Ub798_opaque.png/392x696bb.png",
        "https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/e1/3b/d6/e13bd650-9d51-15be-9a6b-a4990dca4f11/3ec084c1-63e6-4fa2-bd66-8d005a372cef_ios_5.5_Ud615_05__Ubc88_Uac1c_Ucf00_Uc5b4_opaque.png/392x696bb.png",
        "https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/30/c6/54/30c65428-0b2c-30c0-f274-7907154ccab4/d57f57c1-d338-407f-85ef-6807baae5a2b_ios_5.5_Ud615_06__Ubc88_Uac1c_Ud398_Uc774_opaque.png/392x696bb.png",
        "https://is5-ssl.mzstatic.com/image/thumb/Purple126/v4/55/35/3a/55353a5d-68b1-1002-e953-276e57c8c879/4d80f726-29d6-48ed-acdb-38c7bb372d00_ios_5.5_Ud615_07__Ubc88_Uac1c_Ud1a1_opaque.png/392x696bb.png",
        "https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/2d/d7/8a/2dd78a7d-b741-965d-ff51-834a74fff5f7/dba0bca3-4998-4b0b-a72c-b8fd21e108e3_ios_5.5_Ud615_08__Ud0dd_Ubc30_opaque.png/392x696bb.png",
        "https://is3-ssl.mzstatic.com/image/thumb/Purple116/v4/ff/86/8d/ff868d0b-9d84-ef05-4b51-031f86bbc0a1/3a39e23a-8f0e-4d70-b96f-abfcb28d3651_ios_5.5_Ud615_09__Uc0c1_Uc810_Ud314_Ub85c_Uc789_opaque.png/392x696bb.png",
        "https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/86/3a/87/863a87b0-5f65-449d-bb60-5dc9f96c690d/482253f1-b9b2-4e57-a7e0-b8e331bafe8f_ios_5.5_Ud615_10__Ub0b4_Ud3f0_Uc2dc_Uc138_opaque.png/392x696bb.png"
    ]
    
    
    private lazy var imageScrollView : ImageSliderView = {
        let slider = ImageSliderView(
            frame: .zero,
            imageURLs: dummyURLs)
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageScrollView)
        //슬라이더 레이아웃 설정
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        let cons = [
            imageScrollView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            imageScrollView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2.0),
            imageScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10)
        ]
        NSLayoutConstraint.activate(cons)
        imageScrollView.setUpImage()
    }
    


}

