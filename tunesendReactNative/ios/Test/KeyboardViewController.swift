//
//  KeyboardViewController.swift
//  Test
//
//  Created by David Yim on 12/25/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIInputViewController {
  
  var keyboardView: UIView!
  var player = AVAudioPlayer()
  
//  let path = Bundle.main.path(forResource: "Piano_C", ofType: "wav")
  
  let pathA = Bundle.main.path(forResource: "Piano_A", ofType: "wav")
  let pathAs = Bundle.main.path(forResource: "Piano_A#", ofType: "wav")
  let pathB = Bundle.main.path(forResource: "Piano_B", ofType: "wav")
  let pathC = Bundle.main.path(forResource: "Piano_C", ofType: "wav")
  let pathCs = Bundle.main.path(forResource: "Piano_C#", ofType: "wav")
  let pathD = Bundle.main.path(forResource: "Piano_D", ofType: "wav")
  let pathDs = Bundle.main.path(forResource: "Piano_D#", ofType: "wav")
  let pathE = Bundle.main.path(forResource: "Piano_E", ofType: "wav")
  let pathF = Bundle.main.path(forResource: "Piano_F", ofType: "wav")
  let pathFs = Bundle.main.path(forResource: "Piano_F#", ofType: "wav")
  let pathG = Bundle.main.path(forResource: "Piano_G", ofType: "wav")
  let pathGs = Bundle.main.path(forResource: "Piano_G#", ofType: "wav")
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    // Add custom view sizing constraints here
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadKeyboard()
//    do {
//
//      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathA!))
////      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
//    } catch {
//      print("Could not load file")
//    }
    
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
  

  @IBOutlet weak var A: UIButton!
  
  

  
  @IBAction func playA(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathA!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playAs(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathAs!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playB(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathB!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playC(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathC!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playCs(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathCs!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playD(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathD!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playDs(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathDs!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playE(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathE!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playF(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathF!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playFs(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathFs!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }

  @IBAction func playG(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathG!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
  }
  
  @IBAction func playGs(sender: Any) {
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathGs!))
    } catch {
      print("Could not load file")
    }
    
    player.play()
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

