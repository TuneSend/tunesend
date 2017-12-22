//
//  KeyboardViewController.swift
//  keyboard
//
//  Created by Michael Haviv on 12/19/17.
//  Copyright © 2017 Michael Haviv. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: UIView!
    var player = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "Kick", ofType: "wav")
//    var isPlaying = false
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadKeyboard()
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        } catch {
            print("Could not load file")
        }
        
    }
    
    @IBAction func hideKeyboard() {
        
        dismissKeyboard()
        
    }
    
    @IBAction func deleteText() {
        
        let proxy = textDocumentProxy
        proxy.deleteBackward()
        
    }
    
    @IBAction func nextKeyboard() {
    
        advanceToNextInputMode()
    
    }
    
    @IBAction func spacePress() {
        
        let proxy = textDocumentProxy
        proxy.insertText(" ")
        
    }
    
    @IBAction func keypress(sender: UIButton!) {
        
        let typedCharacter = sender.titleLabel?.text
        
        let proxy = textDocumentProxy
        proxy.insertText(typedCharacter!)
        
    }
    
    
    func loadKeyboard() {
        
        let keyboardNib = UINib(nibName: "View", bundle: nil)
        keyboardView = keyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.backgroundColor = keyboardView.backgroundColor
        view.addSubview(keyboardView)
        
    }
    
    // MARK: - Properties
    @IBOutlet weak var A: UIButton!
    
   
    
    
    // MARK: - Actions
    
    @IBAction func play(sender: Any) {
//        if isPlaying == false {
            player.play()
//            isPlaying = true
//            A.setTitle("Pause", for: .normal)
//        } else {
//            player.pause()
//            isPlaying = false
////            A.setTitle("Play", for: .normal)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {

    }

}
