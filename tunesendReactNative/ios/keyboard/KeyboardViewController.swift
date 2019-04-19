//
//  KeyboardViewController.swift
//  keyboard
//
//  Created by Michael Haviv on 12/19/17.
//  Copyright © 2017 Michael Haviv. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore
import MobileCoreServices

class KeyboardViewController: UIInputViewController {
  
  // Assigns each media file to a character
  var keyboardView: UIView!

  func createSound(outputFile: String) {
    // CMTime struct represents a length of time that is stored as rational number
    var startTime: CMTime = CMTime.zero
    // AVMutableComposition creates new composition
    let composition: AVMutableComposition = AVMutableComposition()
    // AVMutableCompositionTrack - A mutable track in composition that you use to insert, remove, and scale track segments
    if let compositionAudioTrack: AVMutableCompositionTrack = composition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid) {
      
      for url in allFilesForCharacters() {
        let avAsset: AVURLAsset = AVURLAsset(url: url)
        let timeRange: CMTimeRange = CMTimeRangeMake(start: CMTime.zero, duration: avAsset.duration)
        let audioTrack: AVAssetTrack = avAsset.tracks(withMediaType: AVMediaType.audio)[0]
        try? compositionAudioTrack.insertTimeRange(timeRange, of: audioTrack, at: startTime)
        startTime = CMTimeAdd(startTime, timeRange.duration)
      }
    }
    
    let exportPath: String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path+"/"+outputFile+".m4a"
    
    try? FileManager.default.removeItem(atPath: exportPath)
    
    if let export: AVAssetExportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetAppleM4A) {
      
      export.outputURL = URL(fileURLWithPath: exportPath)
      export.outputFileType = AVFileType.m4a
      
      export.exportAsynchronously {
        if export.status == AVAssetExportSession.Status.completed {
          NSLog("All done");
          if let outputURL = export.outputURL {
            if let data = try? Data(contentsOf: outputURL) {
              let board = UIPasteboard.general
              board.setData(data, forPasteboardType: kUTTypeMPEG4Audio as String)
            }
          }
        }
        else {
          print(export.error?.localizedDescription ?? "")
        }
      }
    }
  }
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    loadKeyboard()
  }
  
  func getReturnKeyTitle() -> String{
    if let returnKeyType = textDocumentProxy.returnKeyType {
      switch returnKeyType {
      case UIReturnKeyType.go:
        return "Go"
      case UIReturnKeyType.continue:
        return "Continue"
      case UIReturnKeyType.search:
        return "Search"
      case UIReturnKeyType.done:
        return "Done"
      case UIReturnKeyType.google:
        return "Google"
      case UIReturnKeyType.join:
        return "Join"
      case UIReturnKeyType.next:
        return "Next"
      default:
        return "return"
      }
    }
    return "return"
  }
  
  // view doesnt call updateViewConstraints so when you switch back to the keyboard it keeps the view
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    returnKey.setTitle(getReturnKeyTitle(), for: .normal)
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
  
  @IBAction func returnPressed(sender: AnyObject) {
    let proxy = textDocumentProxy as UITextDocumentProxy
    proxy.insertText("\n")
  }
  
  @IBOutlet weak var returnKey: UIButton!
  
  @IBAction func keypress(sender: UIButton!) {
    guard let typedCharacter = sender.titleLabel?.text else {
      return
    }
    let proxy = textDocumentProxy
    proxy.insertText(typedCharacter)
    
    // Pulsate effect fo keys
    sender.pulsate()
    
    // Audio Playback
    guard  let fileName = MusicFileUtility.shared.getFileNameFor(sender.titleLabel?.text) else {
      return
    }
    // Loads media file according to filename that corresponds from Notes Array
    guard let audioURL = Bundle.main.url(forResource: fileName, withExtension: "mp3", subdirectory: "piano") else {
      return
    }
    var soundId: SystemSoundID = 0
    AudioServicesCreateSystemSoundID(audioURL as CFURL, &soundId)
    AudioServicesPlaySystemSound(soundId)
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
  //@IBOutlet weak var A: UIButton!
  
  func allFilesForCharacters() -> [URL] {
    var fileUrls = [URL]()
    let proxy = textDocumentProxy
    proxy.adjustTextPosition(byCharacterOffset: (proxy.documentContextAfterInput ?? "").count)
    // Sleep Interval so that change is rendered when someone deletes text from middle
    Thread.sleep(forTimeInterval: 0.01);
    // According to cursor position contain text that is before and after
    let chars =    (proxy.documentContextBeforeInput ?? "") +
      (proxy.documentContextAfterInput ?? "")
    // Play notes according to what was pressed
    for char in chars {
      if let fileName = MusicFileUtility.shared.getFileNameFor(String(char)) {
        if  let fileURL = Bundle.main.url(forResource: fileName, withExtension: "mp3", subdirectory: "piano") {
          fileUrls.append(fileURL)
        }
        
      }
    }
    return fileUrls
  }
  //DY playback logic IBAction
  @IBAction func playBackNotes(sender: UIButton) {
    sender.pulsate()
    
    DispatchQueue.global().async {
      for url in self.allFilesForCharacters() {
        var soundId: SystemSoundID = 0        
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        AudioServicesPlaySystemSound(soundId)
        usleep(500000)
        
      }
      self.createSound(outputFile: "myoutput")
    }
    
    
    
  }
  
  //DY keyboard toggle - symbol
  @IBAction func toggleSymbol(sender: Any) {
    loadSymbolKeyboard()
  }
  
  //DY keyboard toggle - number
  @IBAction func toggleNumber(sender: Any) {
    loadNumberKeyboard()
  }
  
  //DY keyboard toggle - LowerCase
  @IBAction func toggleLower(sender: Any) {
    loadLowerCaseKeyboard()
  }
  
  //DY keyboard toggle - UpperCase
  @IBAction func toggleUpper(sender: Any) {
    loadUpperCaseKeyboard()
  }
  
}
