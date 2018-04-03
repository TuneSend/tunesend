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
  
  func getFileNameFor(_ character: String?) -> String? {
    guard let theCharacter = character else {
      return nil
    }
    return notes[theCharacter.lowercased()]
  }

}
