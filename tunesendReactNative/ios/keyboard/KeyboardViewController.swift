//
//  KeyboardViewController.swift
//  keyboard
//
//  Created by Michael Haviv on 12/19/17.
//  Copyright © 2017 Michael Haviv. All rights reserved.
//

import UIKit
import AVFoundation
//import AudioToolbox

class KeyboardViewController: UIInputViewController {
  
  var wavFiles : [String] = []
  
  var keyboardView: UIView!
  var player = AVAudioPlayer()
  
  let path = Bundle.main.resourcePath
  
  func listFiles() {
    let fileManager = FileManager.default
    
    if let path = path {
      let pianoPath = path + "/piano"
      let contents  = try! fileManager.contentsOfDirectory(atPath: pianoPath)
      for item in contents {
        let itemPath = pianoPath + "/" + item
//        print(itemPath)
        wavFiles.append(itemPath)
      }
//      print("this is wav files \(wavFiles)")

    }

  }
  
  func assignFiles() {
    
    
    
  }
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    // Add custom view sizing constraints here
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    listFiles()
    loadKeyboard()
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[0]))
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
  
  
@IBAction func playA(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[1]))
    } catch {
        print("Could not load file")
    }
    player.play()
  }

@IBAction func playAs(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[9]))
      player.play()
  } catch {
    print("Could not load file")
  }
  player.play()
}
  
@IBAction func playB(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[3]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playC(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[2]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playCs(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[7]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playD(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[8]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playDs(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[0]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playE(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[6]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playF(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[4]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playFs(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[10]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playG(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[5]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playGs(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[11]))
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

