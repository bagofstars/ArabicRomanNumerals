import Quick
import Nimble
@testable import ArabicRomanNumerals

class RomanCharacterArabicValueSpec: QuickSpec
{
  override func spec()
  {
    describe("RomanCharacterArabicValue"){
      context("when fed with 'I'-character"){
        it("should always return 1"){
          expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("I", parsingState:RomanNumberParsingState.Empty)).to(equal(1))
        }
      }

      context("when fed with 'V'-character"){
        context("and parsing state machine is in 'IV'-state"){
          it("should return 3 as it must have already added 1 when parsing 'I'"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("V", parsingState:RomanNumberParsingState.IV)).to(equal(3))
          }
        }

        context("and parsing state machine is in 'V'-state"){
          it("should return 5"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("V", parsingState:RomanNumberParsingState.V)).to(equal(5))
          }
        }
      }

      context("when fed with 'X'-character"){
        context("and parsing state machine is in 'IX'-state"){
          it("should return 8 as it must have already added 1 when parsing 'I'"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("X", parsingState:RomanNumberParsingState.IX)).to(equal(8))
          }
        }

        context("and parsing state machine is in any other state"){
          it("should return 10"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("X", parsingState:RomanNumberParsingState.X)).to(equal(10))
          }
        }
      }

      context("when fed with 'L'-character"){
        context("and parsing state machine is in 'XL'-state"){
          it("should return 30 as it must have already added 10 when parsing 'X'"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("L", parsingState:RomanNumberParsingState.XL)).to(equal(30))
          }
        }

        context("and parsing state machine is in any other state"){
          it("should return 50"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("L", parsingState:RomanNumberParsingState.L)).to(equal(50))
          }
        }
      }

      context("when fed with 'C'-character"){
        context("and parsing state machine is in 'XC'-state"){
          it("should return 90 as it must have already added 10 when parsing 'X'"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("C", parsingState:RomanNumberParsingState.XC)).to(equal(80))
          }
        }

        context("and parsing state machine is in any other state"){
          it("should return 100"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("C", parsingState:RomanNumberParsingState.C)).to(equal(100))
          }
        }
      }

      context("when fed with 'D'-character"){
        context("and parsing state machine is in 'CD'-state"){
          it("should return 300 as it must have already added 100 when parsing 'C'"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("D", parsingState:RomanNumberParsingState.CD)).to(equal(300))
          }
        }

        context("and parsing state machine is in any other state"){
          it("should return 500"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("D", parsingState:RomanNumberParsingState.D)).to(equal(500))
          }
        }
      }

      context("when fed with 'M'-character"){
        context("and parsing state machine is in 'CM'-state"){
          it("should return 800 as it must have already added 100 when parsing 'C'"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("M", parsingState:RomanNumberParsingState.CM)).to(equal(800))
          }
        }

        context("and parsing state machine is in any other state"){
          it("should return 1000"){
            expect(RomanCharacterArabicValue.arabicValueForRomanCharacter("M", parsingState:RomanNumberParsingState.M)).to(equal(1000))
          }
        }
      }
    }
  }
}
