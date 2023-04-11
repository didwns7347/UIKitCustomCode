//
//  SelectUISampleViewController.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/03/29.
//

import UIKit

class SelectUISampleViewController: UIViewController {
    let menus = ["버티컬 슬라이더뷰","이미지 슬라이더 스크롤뷰","호리젠탈 콜렉션 뷰","캡쳐방지 이미지"]
    let viewConrollers : [UIViewController] = [
        MyScrollViewController(),
        ImageSliderViewController(),
        ImageSdlierCollectionViewController(),
        CapturePreventViewController()
    ]
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUPNavigation()
        setUplayout()

    }

    private func setUPNavigation(){
        self.navigationItem.title = "UI선택"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    /**레이아웃설정*/
    private func setUplayout(){
        view.addSubview(tableView)
        let tvCons = [
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tvCons)
    }
}
extension SelectUISampleViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.show(self.viewConrollers[indexPath.row], sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension SelectUISampleViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menus[indexPath.row]
        return cell
    }
    
    
}
