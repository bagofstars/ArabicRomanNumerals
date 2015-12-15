//
//  RomanNumberParsingStateMachine.swift
//  ArabicRomanNumerals
//
//  Created by Marcin Hawro on 12/11/2015.
//  Copyright © 2015 Bag of Stars. All rights reserved.
//

enum RomanNumberParsingState
{
  case Empty, I, V, X, L, C, D, M, II, XX, CC, MM, III, XXX, CCC, MMM, CM, CD, XC, XL, IX, IV, Invalid
}

struct RomanNumberParsingStateMachine
{
  private(set) var currentState: RomanNumberParsingState

  init() {
    currentState = .Empty
  }

  mutating func updateStateForCharacter(newCharacter: Character)
  {
    currentState = nextStateForCharacter(newCharacter)
  }

  func isStateInvalid() -> Bool
  {
    return currentState == .Invalid
  }


//MARK:- Private methods

  private func nextStateForCharacter(newCharacter: Character) -> RomanNumberParsingState
  {
    if (newCharacter == "M" || newCharacter == "m") {
      return stateChangeForCharacterM()
    }

    if (newCharacter == "D" || newCharacter == "d") {
      return stateChangeForCharacterD()
    }

    if (newCharacter == "C" || newCharacter == "c") {
      return stateChangeForCharacterC()
    }
    
    if (newCharacter == "L" || newCharacter == "l") {
      return stateChangeForCharacterL()
    }

    if (newCharacter == "X" || newCharacter == "x") {
      return stateChangeForCharacterX()
    }

    if (newCharacter == "V" || newCharacter == "v") {
      return stateChangeForCharacterV()
    }

    if (newCharacter == "I" || newCharacter == "i") {
      return stateChangeForCharacterI()
    }

    return .Empty
  }

  private func stateChangeForCharacterM() -> RomanNumberParsingState
  {
    switch currentState {
      case .Empty: return .M;
      case .M: return .MM;
      case .MM: return .MMM;
      case .C: return .CM;
      default: return .Invalid
    }
  }

  private func stateChangeForCharacterD() -> RomanNumberParsingState
  {
    switch currentState {
      case .Empty, .M, .MM, .MMM: return .D
      case .C: return .CD;
      default: return .Invalid
    }
  }

  private func stateChangeForCharacterC() -> RomanNumberParsingState
  {
    switch currentState {
      case .Empty, .MMM, .MM, .M, .D: return .C
      case .C: return .CC
      case .CC: return .CCC
      case .X: return .XC
      default: return .Invalid
    }
  }

  private func stateChangeForCharacterL() -> RomanNumberParsingState
  {
    switch currentState {
      case .Empty, .M, .D, .C, .CC, .MM, .CCC, .MMM, .CM, .CD: return .L
      case .X: return .XL
      default: return .Invalid
    }
  }

  private func stateChangeForCharacterX() -> RomanNumberParsingState
  {
    switch currentState {
      case .Empty, .L, .C, .D, .M, .CC, .MM, .CCC, .MMM, .CM, .CD: return .X
      case .X: return .XX
      case .XX: return .XXX
      case .I: return .IX
      default: return .Invalid
    }
  }

  private func stateChangeForCharacterV() -> RomanNumberParsingState
  {
    switch currentState {
      case .V, .II, .III, .IX, .IV: return .Invalid
      case .I: return .IV
      default: return .V
    }
  }

  private func stateChangeForCharacterI() -> RomanNumberParsingState
  {
    switch currentState {
      case .III, .IV, .IX: return .Invalid
      case .I: return .II
      case .II: return .III
      default: return .I
    }
  }
}
