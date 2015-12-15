//Playground demonstrates arabic <-> roman numeric conversions


//Below you can try converting different arabic integers into roman numbers in a string format.
//Supported range of numbers is [1, 3999]

var str = try! ArabicToRoman.romanNumberFromArabicNumber(3999)



//Here you can try converting strings which represents roman numbers into arabic numbers.
//All numbers between I and MMMCMXCIX are supported. Lowercase and uppercase characters are acceptable.

var resultArabicNumber = try! RomanToArabic.arabicNumberFromRomanNumber("MMcDXcvIi")

 