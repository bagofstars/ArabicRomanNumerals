import Quick
import Nimble
@testable import ArabicRomanNumerals

//TODO: implement it as extension of Int and String!!!


class ArabicRomanSpec: QuickSpec
{
  override func spec()
  {
    describe("ArabicToRoman converter"){
      context("when converting from arabic to roman numbers"){
        context("and values for conversion are out of range"){
          it("should throw an exception"){
            expect{ try ArabicToRoman.romanNumberFromArabicNumber(0) }.to(throwError(ArabicToRomanError.ExceededRange))
            expect{ try ArabicToRoman.romanNumberFromArabicNumber(4000) }.to(throwError(ArabicToRomanError.ExceededRange))
          }
        }

        it("should return correct values"){
          for index in 0...998 {
            let convertedArabicNumber = index + 1
            expect(try! ArabicToRoman.romanNumberFromArabicNumber(convertedArabicNumber)).to(equal(SupportedRomanNumbers.romanNumbers1To999[index]))
            expect(try! ArabicToRoman.romanNumberFromArabicNumber(convertedArabicNumber + 999)).to(equal(SupportedRomanNumbers.romanNumbers1000To1999[index]))
            expect(try! ArabicToRoman.romanNumberFromArabicNumber(convertedArabicNumber + 1999)).to(equal(SupportedRomanNumbers.romanNumbers2000To2999[index]))
            expect(try! ArabicToRoman.romanNumberFromArabicNumber(convertedArabicNumber + 2999)).to(equal(SupportedRomanNumbers.romanNumbers3000To3999[index]))
          }
        }
      }
    }
  }
}
