//
//  ViewController.swift
//  keyboard
//
//  Created by Michael Haviv on 12/21/17.
//  Copyright © 2017 Michael Haviv. All rights reserved.
//

import UIKit
import AVFoundation

//var myKick: AVAudioPlayer?

class ViewController: UIViewController {
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Kick" , ofType: "wav")!)
        print(alertSound)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        try! audioPlayer = AVAudioPlayer(contentsOf: alertSound)
        audioPlayer!.prepareToPlay()
        audioPlayer!.play()
    }
}

