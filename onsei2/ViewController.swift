//
//  ViewController.swift
//  onsei new
//
//  Created by 原 あゆみ on 2017/02/18.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    /** 話す内容を入力するテキストフィールド */
    @IBOutlet weak var speechText: UITextView!
    //    @IBOutlet weak var languagePickerView: UIPickerView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet var languagePickerView: UIPickerView? = UIPickerView()
    
    /** SpeechSynthesizerクラス */
    var talker = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance()
    
    
    
    var list=["Arabic(SaudiArabia)","English(SouthAfrica)","Thai(Thailand)","Dutch(Belgium)","German (Germany)","English(Australia)","English(UnitedStates)","Portuguese(Brazil)","Polish(Poland)","English(Ireland)","Greek(Greece)","Indonesian(Indonesia)","Swedish(Sweden)","Turkish(Turkey)","Portuguese(Portugal)","Japanese(Japan)","Korean(Korea)","Hungarian(Hungary)","Czech(CzechRepublic)","Danish(Denmark)","Spanish(Mexico)","French(Canada)","Dutch(Netherlands)","Finnish(Finland)","Spanish(Spain)","Italian(Italy)","Romanian(Romania)","Norwegian(Norway)","Chinese(HongKong)","Chinese(Taiwan)","Slovak(Slovakia)","Chinese(China)","Russian(Russia)","English(UnitedKingdom)","French(France)","Hindi (India)"]
    
    var language2 = ["ar-SA","en-ZA","th-TH","nl-BE","en-AU","de-DE","en-US","pt-BR","pl-PL","en-IE","el-GR","id-ID","sv-SE","tr-TR","pt-PT","ja-JP","ko-KR","hu-HU","cs-CZ","da-DK","es-MX","fr-CA","nl-NL","fi-FI","es-ES","it-IT","ro-RO","no-NO","zh-HK","zh-TW","sk-SK","zh-CN","ru-RU","en-GB","fr-FR","hi-IN"]
    
    var language3 :String!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        talker.speak(utterance)
        //声の高さ（0.5~2.0）
        utterance.pitchMultiplier = 0.5
        // 話す速度を設定（0.0〜1.0）
        utterance.rate = 0.5
        languagePickerView?.dataSource = self
        languagePickerView?.delegate = self
        self.view.addSubview(languagePickerView!)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row] as String
        return language2[row] as String
        language3 = String(language2[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("列: \(row)")
        print("値: \(list[row])")
        print("言語\(language2[row])")
        language3 = String(language2[row])
        
    }
    
    
    
    /** ボタンが押された時の処理 */
    @IBAction func didTapButton(sender: UIButton)
    {
        // 話す内容をセット
        let utterance = AVSpeechUtterance(string:self.speechText.text!)
        // 言語を日本に設定
        utterance.voice = AVSpeechSynthesisVoice(language:language3)
        // 実行
        self.talker.speak(utterance)
    }
    
    /*    @IBAction func didTapUSButton(sender: UIButton)
     {
     // 話す内容をセット
     let utterance = AVSpeechUtterance(string:self.speechText.text!)
     // 言語を英語に設定
     utterance.voice = AVSpeechSynthesisVoice(language: "es-US")
     // 実行
     self.talker.speak(utterance)
     }
     */
    
    @IBAction func soundSlider(sender: UISlider) {
        
    }
    
}
