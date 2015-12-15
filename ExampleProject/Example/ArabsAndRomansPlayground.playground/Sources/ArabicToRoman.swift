//
//  ArabicToRoman.swift
//  ArabicRomanNumerals
//
//  Created by Marcin Hawro on 04/11/2015.
//  Copyright © 2015 Bag of Stars. All rights reserved.
//

private struct ArabicToRomanConsts
{
  static let arabicNumberLowerLimit = 1
  static let arabicNumberUpperLimit = 3999
  
  static let thousandsPartMapper = ["", "M", "MM", "MMM"]
  static let hundredsPartMapper = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  static let tensPartMapper = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  static let onesPartMapper = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
}

enum ArabicToRomanError: ErrorType
{
  case ExceededRange
}


final public class ArabicToRoman
{
  static public func romanNumberFromArabicNumber(var number: Int) throws -> String
  {
    if (number < ArabicToRomanConsts.arabicNumberLowerLimit ||
        number > ArabicToRomanConsts.arabicNumberUpperLimit) {
      throw ArabicToRomanError.ExceededRange
    }

    var constructedRomanNumber = ""
    
    if number >= 1000 {
      let thousandPart = number / 1000
      constructedRomanNumber.appendContentsOf(ArabicToRomanConsts.thousandsPartMapper[thousandPart])
      number = number % 1000
    }
    
    if number >= 100 {
      let hundredPart = number / 100
      constructedRomanNumber.appendContentsOf(ArabicToRomanConsts.hundredsPartMapper[hundredPart])
      number = number % 100
    }
    
    if number >= 10 {
      let tenPart = number / 10
      constructedRomanNumber.appendContentsOf(ArabicToRomanConsts.tensPartMapper[tenPart])
      number = number % 10
    }
    
    constructedRomanNumber.appendContentsOf(ArabicToRomanConsts.onesPartMapper[number])
    
    return constructedRomanNumber
  }
}
