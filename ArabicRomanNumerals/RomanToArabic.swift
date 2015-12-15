//
//  RomanToArabic.swift
//  ArabicRomanNumerals
//
//  Created by Marcin Hawro on 07/11/2015.
//  Copyright © 2015 Bag of Stars. All rights reserved.
//

import Foundation.NSCharacterSet

private struct RomanToArabicConsts
{
  static let allowedCharacterSet = NSCharacterSet(charactersInString:"ivxlcdmIVXLCDM")
}

enum RomanToArabicError: ErrorType
{
  case EmptyInputString
  case InvalidRomanCharacter
  case InvalidRomanNumberFormat
}

final class RomanToArabic
{
  static func arabicNumberFromRomanNumber(romanNumber: String) throws -> Int
  {
    try validateInputStringIsNotEmpty(romanNumber)
    try validateCharactersInRomanNumber(romanNumber)
    return try calculatedArabicNumberFromRomanNumber(romanNumber)
  }


//MARK:- Private metods

  static private func calculatedArabicNumberFromRomanNumber(romanNumber: String) throws -> Int
  {
    var parsingStateMachine = RomanNumberParsingStateMachine()

    var calculatedArabicNumber = 0

    for currentCharacter in romanNumber.characters {
      parsingStateMachine.updateStateForCharacter(currentCharacter)

      if parsingStateMachine.isStateInvalid() {
        throw RomanToArabicError.InvalidRomanNumberFormat
      }

      calculatedArabicNumber += RomanCharacterArabicValue.arabicValueForRomanCharacter(currentCharacter, parsingState:parsingStateMachine.currentState)
    }

    return calculatedArabicNumber
  }

  static private func validateInputStringIsNotEmpty(romanNumber: String) throws
  {
    if romanNumber.isEmpty {
      throw RomanToArabicError.EmptyInputString
    }
  }

  static private func validateCharactersInRomanNumber(romanNumber: String) throws
  {
    for singleCharacter in romanNumber.utf16 {
      let characterIsValid = RomanToArabicConsts.allowedCharacterSet.characterIsMember(singleCharacter)
      if !characterIsValid {
        throw RomanToArabicError.InvalidRomanCharacter
      }
    }
  }
}
