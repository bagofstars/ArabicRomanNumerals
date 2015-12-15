//
//  RomanCharacterArabicValue.swift
//  ArabicRomanNumerals
//
//  Created by Marcin Hawro on 15/11/2015.
//  Copyright © 2015 Bag of Stars. All rights reserved.
//

//Class which returns numeric value from roman number for the given state.

struct RomanCharacterArabicValue
{
  static func arabicValueForRomanCharacter(romanCharacter: Character, parsingState: RomanNumberParsingState) -> Int
  {
    if romanCharacter == "I" || romanCharacter == "i" {
      return 1
    }

    if romanCharacter == "V" || romanCharacter == "v" {
      switch (parsingState) {
        case .IV: return 3
        default: return 5
      }
    }

    if romanCharacter == "X" || romanCharacter == "x" {
      switch (parsingState) {
        case .IX: return 8
        default : return 10
      }
    }

    if romanCharacter == "L" || romanCharacter == "l" {
      switch (parsingState) {
        case .XL: return 30
        default : return 50
      }
    }

    if romanCharacter == "C" || romanCharacter == "c" {
      switch (parsingState) {
        case .XC: return 80
        default : return 100
      }
    }

    if romanCharacter == "D" || romanCharacter == "d" {
      switch (parsingState) {
        case .CD: return 300
        default : return 500
      }
    }

    if romanCharacter == "M" || romanCharacter == "m" {
      switch (parsingState) {
        case .CM: return 800
        default : return 1000
      }
    }

    return 0
  }
}
