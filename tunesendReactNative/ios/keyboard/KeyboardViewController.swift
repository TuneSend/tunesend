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
//DY add for playback
var playBack = [Int]()
///test
extension UIButton {
  
  func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.6
    pulse.fromValue = 0.90
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = 1
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
  //DY logic for playback
  let queuePlayer = AVQueuePlayer()
  
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
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
  }
  
  //DY for playback
  func things() {
    for number in playBack {
      let fileURL = URL(fileURLWithPath:wavFiles[number])
      let playerItem = AVPlayerItem(url:fileURL as URL)
      queuePlayer.insert(playerItem, after:nil)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    listFiles()
    loadKeyboard()
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
    
    //start of keypress action
    sender.pulsate()
  }
  
  @IBAction func pulsatePlay(sender: UIButton!) {
    
    sender.pulsate()
    
  }
  
  func loadKeyboard() {
    
    let keyboardNib = UINib(nibName: "ViewLowerCase", bundle: nil)
    keyboardView = keyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.backgroundColor = keyboardView.backgroundColor
    view.addSubview(keyboardView)
    
  }
  
  //symbol keyboard
  func loadSymbolKeyboard() {
    let keyboardNib = UINib(nibName: "ViewSymbols", bundle: nil)
    keyboardView = keyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.backgroundColor = keyboardView.backgroundColor
    view.addSubview(keyboardView)
  }
  
  //lowerCase keyboard
  func loadLowerCaseKeyboard() {
    let keyboardNib = UINib(nibName: "ViewLowerCase", bundle: nil)
    keyboardView = keyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.backgroundColor = keyboardView.backgroundColor
    view.addSubview(keyboardView)
  }
  
  //upperCase keyboard
  func loadUpperCaseKeyboard() {
    let keyboardNib = UINib(nibName: "ViewUpperCase", bundle: nil)
    keyboardView = keyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.backgroundColor = keyboardView.backgroundColor
    view.addSubview(keyboardView)
  }
  
  //Number keyboard
  func loadNumberKeyboard() {
    let keyboardNib = UINib(nibName: "View123", bundle: nil)
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
  
  //DY playback logic
    playBack.append(16)
  }

@IBAction func playAs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[21]))
      player.play()
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(22)
}
  
@IBAction func playB4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[6]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(6)
}

@IBAction func playC4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[7]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(7)
}

@IBAction func playCs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[26]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(26)
}

@IBAction func playD4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[1]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(1)
}


@IBAction func playDs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[11]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(11)
}


@IBAction func playE4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[3]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(3)
}


@IBAction func playF4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[18]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(18)
}


@IBAction func playFs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[12]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(12)
}


@IBAction func playG4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[27]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(27)
}


@IBAction func playGs4(sender: Any) {
  do {
    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[17]))
  } catch {
    print("Could not load file")
  }
  player.play()
  
  //DY playback logic
  playBack.append(17)
}
  
  @IBAction func playA5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[15]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(15)
  }
  
  @IBAction func playAs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[23]))
      player.play()
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(24)
  }
  
  @IBAction func playB5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[5]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(5)
  }
  
  @IBAction func playC5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[8]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(8)
  }
  
  @IBAction func playCs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[25]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(21)
  }
  
  @IBAction func playD5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[0]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(0)
  }
  
  @IBAction func playDs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[10]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(10)
  }
  
  @IBAction func playE5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[4]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(4)
  }
  
  @IBAction func playF5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[19]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(19)
  }
  
  @IBAction func playFs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[14]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(14)
  }
  
  @IBAction func playG5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[24]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(25)
  }
  
  @IBAction func playGs5(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[20]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(20)
  }
  
  @IBAction func playC6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[9]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(9)
  }
  
  @IBAction func playCs6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[22]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(23)
  }
  
  @IBAction func playD6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[2]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(2)
  }
  
  @IBAction func playDs6(sender: Any) {
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: wavFiles[13]))
    } catch {
      print("Could not load file")
    }
    player.play()
    
    //DY playback logic
    playBack.append(13)
  }
  
  
  //DY playback logic IBAction
  @IBAction func playBackNotes(sender: Any) {
    things()
    queuePlayer.play()
    playBack.removeAll()
  }
  
  //DY keyboard toggle - symbol
  @IBAction func toggleSymbol(sender: Any) {
    listFiles()
    loadSymbolKeyboard()
  }

  //DY keyboard toggle - number
  @IBAction func toggleNumber(sender: Any) {
    listFiles()
    loadNumberKeyboard()
  }
  
  //DY keyboard toggle - LowerCase
  @IBAction func toggleLower(sender: Any) {
    listFiles()
    loadLowerCaseKeyboard()
  }
  
  //DY keyboard toggle - UpperCase
  @IBAction func toggleUpper(sender: Any) {
    listFiles()
    loadUpperCaseKeyboard()
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

