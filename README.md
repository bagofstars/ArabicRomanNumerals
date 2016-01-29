# ArabicRomanNumerals

####What is it?
It is a simple Swift converter from arabic numbers to roman numbers and from roman numbers to arabic. The supported range of the converted numbers is from 1 to 3999.

####How to use it?
Grab four files from the ArabicRomanNumerals directory and add it to your project.
Example arabic to roman conversion:
```swift
var resultRomanNumber = try! ArabicToRoman.romanNumberFromArabicNumber(1689)
```
Example roman to arabic conversion:
```swift
var resultArabicNumber = try! RomanToArabic.arabicNumberFromRomanNumber("MMcDXcvIi")
```
It's also demonstrated in the playground inside of the example project. Don't run the Xcode project because nothing (interesting) will happen. Just find `ArabsAndRomansPlayground.playground` and try different numbers.

####Why there are only numbers from 1 to 3999 supported?
Because the number zero ["does not have its own Roman numeral"](https://en.wikipedia.org/wiki/Roman_numerals#Zero). Part of the number 4000 is in turn represented by 'V with bar over it' which is not an ASCII character. This also applies to other numbers greater than 4000 - hence the limit.

####Licence 
MIT
