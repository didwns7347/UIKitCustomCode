//
//  ImageSliderCollectionViewController.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/03/29.
//

import UIKit
class ImageSdlierCollectionViewController : UIViewController{
    var currentIndex: Int = 0
    let dummyURLs = [
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
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let offset:CGFloat = 16.0
        //화면에 오프셋 + 이미지길이 + 오프셋 + 다음이미지 절반을 나타내기위한 넓이 조절
        let width: CGFloat = (view.bounds.width - offset - offset) / 3.0 * 2.0
        layout.itemSize = CGSize(width: width, height: view.bounds.height*0.5)
        layout.minimumLineSpacing = 16.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        //이거 트루로하면 그냥 한화면에 들어오는 사이즈로 넘겨버림
        collectionView.isPagingEnabled = false
        //페이징 에니메이션 속도 설정
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUplayout()
    }
    
    func setUplayout(){
        view.addSubview(collectionView)
        let cons = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(cons)
        
    }
}

extension ImageSdlierCollectionViewController : UICollectionViewDelegate{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        // 이동한 x좌표 값과 item의 크기를 비교 후 페이징 값 설정

        // 스크롤 방향 체크
        // item 절반 사이즈 만큼 스크롤로 판단하여 올림, 내림 처리
        if velocity.x > 0 , currentIndex < dummyURLs.count{
            self.currentIndex = currentIndex + 1
        } else if velocity.x < 0 , currentIndex > 0{
            self.currentIndex -= 1
        } else {
            print("hello")
        }
        print(currentIndex)
        // 위 코드를 통해 페이징 될 좌표 값을 targetContentOffset에 대입
        targetContentOffset.pointee = CGPoint(x: CGFloat(currentIndex) * cellWidthIncludingSpacing, y: 0)
        
        
    }
    
}
extension ImageSdlierCollectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        //이미지 가져오기 코드 라이브러리 추가하기 귀찮아서 직접구현
        DispatchQueue.global().async {
            guard let url = URL(string: self.dummyURLs[indexPath.row]) else {return}
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell?.imageView.image = UIImage(data: data!)
            }
        }
        return cell ?? UICollectionViewCell()
    }
    
    
}
