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
import QuartzCore

extension UIButton {
  
  func pulsate() {
    
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.6
    pulse.fromValue = 0.95
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = 2
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    
    layer.add(pulse, forKey: "pulse")
  }
}

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
  
  // view doesnt call updateViewConstraints so when you switch back to the keyboard it keeps the view
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let keyboardHeight: CGFloat = 218
    let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: keyboardHeight)
    view.addConstraint(heightConstraint)
    view.layoutIfNeeded()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    keyboardView.frame = self.view.bounds
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
    
    let typedCharacter = sender.titleLabel?.text?.lowercased()
    
    let proxy = textDocumentProxy
    proxy.insertText(typedCharacter!)
    
    //start of keypress action
    sender.pulsate()
    
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
  
  
@IBAction func playA4(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[16]))
    } catch {
        print("Could not load file")
    }
    player.play()
  }

@IBAction func playAs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[22]))
      player.play()
  } catch {
    print("Could not load file")
  }
  player.play()
}
  
@IBAction func playB4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[6]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playC4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[7]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playCs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[26]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playD4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[1]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playDs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[11]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playE4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[3]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playF4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[18]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playFs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[12]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playG4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[27]))
  } catch {
    print("Could not load file")
  }
  player.play()
}


@IBAction func playGs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[17]))
  } catch {
    print("Could not load file")
  }
  player.play()
}
  
  @IBAction func playA5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[15]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  @IBAction func playAs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[24]))
      player.play()
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  @IBAction func playB5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[5]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playC5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[8]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playCs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[21]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playD5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[0]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playDs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[10]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playE5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[4]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playF5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[19]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playFs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[14]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playG5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[25]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playGs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[20]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  @IBAction func playC6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[9]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playCs6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[23]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playD6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[2]))
    } catch {
      print("Could not load file")
    }
    player.play()
  }
  
  
  @IBAction func playDs6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[13]))
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

