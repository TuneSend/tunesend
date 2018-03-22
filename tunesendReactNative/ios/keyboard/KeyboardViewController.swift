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
  var mp3Files : [String] = []
  
  // Assigns each media file to a character
  var notes: [String: String] = [
                          // Lower Case
                                "a" : "Piano G4",
                                "b" : "Piano E4",
                                "c" : "Piano D4",
                                "d" : "Piano A4",
                                "e" : "Piano F#5",
                                "f" : "Piano A#4",
                                "g" : "Piano B4",
                                "h" : "Piano C5",
                                "i" : "Piano B5",
                                "j" : "Piano C#5",
                                "k" : "Piano D5",
                                "l" : "Piano D#5",
                                "m" : "Piano F#4",
                                "n" : "Piano F4",
                                "o" : "Piano C6",
                                "p" : "Piano C#6",
                                "q" : "Piano E5",
                                "r" : "Piano G5",
                                "s" : "Piano G#4",
                                "t" : "Piano G#5",
                                "u" : "Piano A#5",
                                "v" : "Piano D#4",
                                "w" : "Piano F5",
                                "x" : "Piano C#4",
                                "y" : "Piano A5",
                                "z" : "Piano C4",
                          // Upper Case
                                "A" : "Piano G4",
                                "B" : "Piano E4",
                                "C" : "Piano D4",
                                "D" : "Piano A4",
                                "E" : "Piano F#5",
                                "F" : "Piano A#4",
                                "G" : "Piano B4",
                                "H" : "Piano C5",
                                "I" : "Piano B5",
                                "J" : "Piano C#5",
                                "K" : "Piano D5",
                                "L" : "Piano D#5",
                                "M" : "Piano F#4",
                                "N" : "Piano F4",
                                "O" : "Piano C6",
                                "P" : "Piano C#6",
                                "Q" : "Piano E5",
                                "R" : "Piano G5",
                                "S" : "Piano G#4",
                                "T" : "Piano G#5",
                                "U" : "Piano A#5",
                                "V" : "Piano D#4",
                                "W" : "Piano F5",
                                "X" : "Piano C#4",
                                "Y" : "Piano A5",
                                "Z" : "Piano C4",
                        // Symbols
                                "|" : "Piano G4",
                                "'" : "Piano E4",
                                "?" : "Piano D4",
                                "<" : "Piano A4",
                                "}" : "Piano F#5",
                                ">" : "Piano A#4",
                                "€" : "Piano B4",
                                "£" : "Piano C5",
                                "+" : "Piano B5",
                                "¥" : "Piano C#5",
                                "·" : "Piano D5",
                                "[" : "Piano D#5",
                                "\\" : "Piano F#4",
                                "_" : "Piano F4",
                                "=" : "Piano C6",
                                "]" : "Piano E5",
                                "#" : "Piano G5",
                                "~" : "Piano G#4",
                                "%" : "Piano G#5",
                                "*" : "Piano A#5",
                                "!" : "Piano D#4",
                                "{" : "Piano F5",
                                "," : "Piano C#4",
                                "^" : "Piano A5",
                                "." : "Piano C4",
                        // Numbers
                                ":" : "Piano G4",
//                                "'" : "Piano E4",
//                                "?" : "Piano D4",
                                "(" : "Piano A4",
                                "4" : "Piano F#5",
                                ")" : "Piano A#4",
                                "$" : "Piano B4",
                                "&" : "Piano C5",
                                "9" : "Piano B5",
                                "@" : "Piano C#5",
                                "\"" : "Piano D5",
                                "1" : "Piano D#5",
                                "/" : "Piano F#4",
                                "-" : "Piano F4",
                                "0" : "Piano C6",
                                "2" : "Piano E5",
                                "5" : "Piano G5",
                                ";" : "Piano G#4",
                                "6" : "Piano G#5",
                                "8" : "Piano A#5",
//                                "!" : "Piano D#4",
                                "3" : "Piano F5",
//                                "," : "Piano C#4",
                                "7" : "Piano A5"
//                                "." : "Piano C4"
                                 ]
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
        mp3Files.append(itemPath)
      }
    }
  }

  override func updateViewConstraints() {
    super.updateViewConstraints()
  }

  //DY for playback
  func things() {
    for number in playBack {
      let fileURL = URL(fileURLWithPath:mp3Files[number])
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

  // Deletes text and corresponding media file from queue
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
    guard let typedCharacter = sender.titleLabel?.text else {
      return
    }
    let proxy = textDocumentProxy
    proxy.insertText(typedCharacter)

    // Pulsate effect fo keys
    sender.pulsate()
    
    // Audio Playback
    guard  let fileName = notes[typedCharacter.lowercased()] else {
      return
    }
    // Loads media file according to filename that corresponds from Notes Array
    guard let audioURL = Bundle.main.url(forResource: fileName, withExtension: "wav", subdirectory: "piano") else {
      return
    }
    do {
      player = try AVAudioPlayer(contentsOf:  audioURL)
    } catch {
      print(error.localizedDescription)
    }
    player.play()
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

  //DY playback logic IBAction
  @IBAction func playBackNotes(sender: Any) {
    //things()
    let proxy = textDocumentProxy
    proxy.adjustTextPosition(byCharacterOffset: (proxy.documentContextAfterInput ?? "").count)
    // Sleep Interval so that change is rendered when someone deletes text from middle
    Thread.sleep(forTimeInterval: 0.01);
    // According to cursor position contain text that is before and after
    let chars =    (proxy.documentContextBeforeInput ?? "") +
        (proxy.documentContextAfterInput ?? "")
    // Play notes according to what was pressed
    for char in chars {
      if let fileName = notes[String(char)] {
        if  let fileURL = Bundle.main.url(forResource: fileName, withExtension: "wav", subdirectory: "piano") {
          let playerItem = AVPlayerItem(url:fileURL)
          queuePlayer.insert(playerItem, after:nil)
        }
      }
  
    }
    queuePlayer.play()
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
//      print("TExt changed")
  }
}
