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
    @IBOutlet weak var soundslider: UISlider!
    @IBOutlet weak var soundlabel: UILabel!
    @IBOutlet weak var speedslider: UISlider!
    @IBOutlet weak var speedlabel: UILabel!
    @IBOutlet weak var toneslider: UISlider!
    @IBOutlet weak var tonelabel: UILabel!
    


    /** SpeechSynthesizerクラス */
    var talker = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance()
    
    
    
    var list=["Arabic(SaudiArabia)","English(SouthAfrica)","Thai(Thailand)","Dutch(Belgium)","German (Germany)","English(Australia)","English(UnitedStates)","Portuguese(Brazil)","Polish(Poland)","English(Ireland)","Greek(Greece)","Indonesian(Indonesia)","Swedish(Sweden)","Turkish(Turkey)","Portuguese(Portugal)","Japanese(Japan)","Korean(Korea)","Hungarian(Hungary)","Czech(CzechRepublic)","Danish(Denmark)","Spanish(Mexico)","French(Canada)","Dutch(Netherlands)","Finnish(Finland)","Spanish(Spain)","Italian(Italy)","Romanian(Romania)","Norwegian(Norway)","Chinese(HongKong)","Chinese(Taiwan)","Slovak(Slovakia)","Chinese(China)","Russian(Russia)","English(UnitedKingdom)","French(France)","Hindi (India)"]
    
    var language2 = ["ar-SA","en-ZA","th-TH","nl-BE","en-AU","de-DE","en-US","pt-BR","pl-PL","en-IE","el-GR","id-ID","sv-SE","tr-TR","pt-PT","ja-JP","ko-KR","hu-HU","cs-CZ","da-DK","es-MX","fr-CA","nl-NL","fi-FI","es-ES","it-IT","ro-RO","no-NO","zh-HK","zh-TW","sk-SK","zh-CN","ru-RU","en-GB","fr-FR","hi-IN"]
    
   var languagetext = ["قم بإدخال النص","enter the text","รุณากรอกข้อความ","Typ tekst","Bitte geben Sie den Text","Geben Sie Text","enter the text","digite o texto","wpisz tekst","enter the text","Πληκτρολογήστε κείμενο","Teks Masukkan","Skriv text","metin girin","Digite o texto","テキストを入力","텍스트를 입력하십시오","Kérjük írja be a képen","Prosím zadejte text","Indtast teksten","Por favor introduzca el texto","S’il vous plaît entrer le texte","Typ tekst","Ole hyvä ja kirjoita teksti","Por favor  introduzca el texto","Inserisci il testo","Vă rugăm să introduceți textul","Vennligst skriv inn teksten","请输入文字”","请输入文字”","Prosím zadajte text","请输入文字","Пожалуйста  введите текст","enter the text","S’il vous plaît entrer le texte","अपना पाठ दर्ज करें"]
    
    var language3 :String!
    var textdefault :String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        talker.speak(utterance)
        
   /*      // 話す速度を設定（0.0〜1.0）
         utterance.rate = 0.5
         */
        languagePickerView?.dataSource = self
        languagePickerView?.delegate = self
        self.view.addSubview(languagePickerView!)

        
       // UISliderの最大値・最小値を指定
        soundslider.minimumValue = 0.0
        soundslider.maximumValue = 100.0
        
        speedslider.minimumValue = 0.0
        speedslider.maximumValue = 1.0
        
        toneslider.minimumValue = 0.5
        toneslider.maximumValue = 2.0
        // UISliderの初期値を指定
        soundslider.setValue(50.0, animated: true)
        speedslider.setValue(0.5, animated: true)
        toneslider.setValue(1.25, animated: true)
     //   speechText.text = String(textdefault)
        
        
        
      
 
        
        
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
        textdefault = String(languagetext[row])
        speechText.text = String(textdefault)
        
    }
    
    
    
    /** ボタンが押された時の処理 */
    @IBAction func didTapButton(sender: UIButton)
    {
        // 話す内容をセット
        let utterance = AVSpeechUtterance(string:self.speechText.text!)
        // 言語を日本に設定
        utterance.voice = AVSpeechSynthesisVoice(language:language3)
        // 実行
        utterance.rate = speedslider.value
        utterance.volume = soundslider.value
        utterance.pitchMultiplier = toneslider.value
    
       
        
        self.talker.speak(utterance)
             }
    
    @IBAction func pause(sender: UIButton){
        
        talker.pauseSpeaking(at: AVSpeechBoundary.immediate)
        
    }
    
    @IBAction func stop(sender: UIButton){
        talker.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    @IBAction func play(sender: UIButton){
        talker.continueSpeaking()
        
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
    
 /*   @IBAction func speedsliderChanged(_ sender: UISlider) {
        
        
        
        
        //UILabelの値を更新
        //sender.valueでUISliderの値が取得可能
       utterance.rate = sender.value
        print(sender.value)
        //soundlabel.text = "value: \(sender.value)"
        
        
        //ちなみに、sliderを使って音量や再生速度を調節するには、sender.valueの値をutterance.rate に代入すればよい
        //utterance.rate = sender.value
        
        //補足
        //声のボリュームを指定するには以下のコード
        //utterance.volume =　sender.value
    }
    
    @IBAction func soundSliderChanged(_ sender: UISlider){
        utterance.volume = sender.value

        print(sender.value)
    }
    
    @IBAction func tonesliderChanged(_ sender: UISlider){
        utterance.pitchMultiplier = sender.value
        print(sender.value)

    }
    */
    
}
