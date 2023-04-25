//
//  TTSSampleVC.swift
//  ImageSliderSample_Code
//
//  Created by yangjs on 2023/04/25.
//

import UIKit
import AVFoundation

class TTSSampleVC : UIViewController {
    static let synthesizer = AVSpeechSynthesizer()
    lazy var textField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "문장을 입력하면 읽어줍니다."
        textField.font = .systemFont(ofSize: 20, weight: .bold)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    lazy var speakBtn : UIButton  = {
        let btn = UIButton()
        btn.setTitle("소리 재생", for: .normal)
        btn.addTarget(self, action: #selector(readText), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        setupLayout()
    }
    
    
}
private extension TTSSampleVC {
    @objc func readText(){
        let synthesizer = TTSSampleVC.synthesizer
        let utterance = AVSpeechUtterance(string: self.textField.text ?? "크크루삥뽕")
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.2
        utterance.volume = 1.0

        synthesizer.speak(utterance)
    }
    
    func setupLayout() {
        view.addSubview(textField)
        view.addSubview(speakBtn)
        let tfCons = [
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        textField.heightAnchor.constraint(equalToConstant: 150),
        ]
        let sbCons = [
            speakBtn.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            speakBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            speakBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            speakBtn.heightAnchor.constraint(equalToConstant: 50),
        ]
        NSLayoutConstraint.activate(tfCons)
        NSLayoutConstraint.activate(sbCons)
    }
}
extension TTSSampleVC : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
