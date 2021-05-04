//
//  InsideCalendarViewController.swift
//  FinalProject
//
//  Created by Sun hee Bae on 2021/05/04.
//

import UIKit
import Speech
import AVFoundation

class InsideCalendarViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var myTxt: UILabel!
    let synthesizer = AVSpeechSynthesizer()

    let utterance = AVSpeechUtterance(string: "your string")

    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
    
    utterance.rate = 0.4

    synthesizer.speak(utterance)



    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
