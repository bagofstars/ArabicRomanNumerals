import Quick
import Nimble
@testable import ArabicRomanNumerals

class RomanToArabicSpec: QuickSpec
{
  override func spec()
  {
    describe("RomanToArabic converter") {
      context("when input roman number is empty") {
        it("should throw an exception") {
          expect {
            try RomanToArabic.arabicNumberFromRomanNumber("")
          }.to(throwError(RomanToArabicError.EmptyInputString))
        }
      }

      context("when input roman number contains invalid letters") {
        it("should throw an exception") {
          expect {
            try RomanToArabic.arabicNumberFromRomanNumber("O")
          }.to(throwError(RomanToArabicError.InvalidRomanCharacter))

          expect {
            try RomanToArabic.arabicNumberFromRomanNumber("INX")
          }.to(throwError(RomanToArabicError.InvalidRomanCharacter))

          expect {
            try RomanToArabic.arabicNumberFromRomanNumber("MDCLXVIW")
          }.to(throwError(RomanToArabicError.InvalidRomanCharacter))
        }

        context("when input roman number contains invalid sequence of characters") {
          it("should throw an exception") {
            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("MMMM")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("DM")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("DD")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("CCCC")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("CMC")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("LL")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("LC")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("XXXX")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("XM")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("XCX")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("VV")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("VC")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("IIII")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("IC")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("IXI")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))

            expect {
              try RomanToArabic.arabicNumberFromRomanNumber("IVI")
            }.to(throwError(RomanToArabicError.InvalidRomanNumberFormat))
          }
        }

        context("when roman number has valid format") {
          it("should return correct arabic number") {
            var expectedArabicNumber = 1

            for romanNumber in SupportedRomanNumbers.romanNumbers1To999 {
              expect(try! RomanToArabic.arabicNumberFromRomanNumber(romanNumber)).to(equal(expectedArabicNumber))
              expectedArabicNumber++
            }

            for romanNumber in SupportedRomanNumbers.romanNumbers1000To1999 {
              expect(try! RomanToArabic.arabicNumberFromRomanNumber(romanNumber)).to(equal(expectedArabicNumber))
              expectedArabicNumber++
            }

            for romanNumber in SupportedRomanNumbers.romanNumbers2000To2999 {
              expect(try! RomanToArabic.arabicNumberFromRomanNumber(romanNumber)).to(equal(expectedArabicNumber))
              expectedArabicNumber++
            }

            for romanNumber in SupportedRomanNumbers.romanNumbers3000To3999 {
              expect(try! RomanToArabic.arabicNumberFromRomanNumber(romanNumber)).to(equal(expectedArabicNumber))
              expectedArabicNumber++
            }
          }
        }
        
        context("when roman number has valid format and is lowercase") {
          it("should return correct arabic number") {
            expect(try! RomanToArabic.arabicNumberFromRomanNumber("mdclxvi")).to(equal(1666))
          }
        }
      }
    }
  }
}
