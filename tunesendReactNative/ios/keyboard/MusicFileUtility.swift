//
//  MusicFileUtility.swift
//  keyboard
//
//  Created by Michael Haviv on 4/3/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit

class MusicFileUtility: NSObject {
  
  static let shared = MusicFileUtility()
  
  var notes: [String: String] = [
    // Lower Case
    "a" : "Piano C4",
    "b" : "Piano G4",
    "c" : "Piano E4",
    "d" : "Piano E4",
    "e" : "Piano G5",
    "f" : "Piano F4",
    "g" : "Piano G4",
    "h" : "Piano A4",
    "i" : "Piano E5",
    "j" : "Piano B4",
    "k" : "Piano C5",
    "l" : "Piano D5",
    "m" : "Piano B4",
    "n" : "Piano A4",
    "o" : "Piano F5",
    "p" : "Piano G5",
    "q" : "Piano E5",
    "r" : "Piano A5",
    "s" : "Piano D4",
    "t" : "Piano B5",
    "u" : "Piano D5",
    "v" : "Piano F4",
    "w" : "Piano F5",
    "x" : "Piano D4",
    "y" : "Piano C5",
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
  
  func getFileNameFor(_ character: String?) -> String? {
    guard let theCharacter = character else {
      return nil
    }
    return notes[theCharacter.lowercased()]
  }

}
