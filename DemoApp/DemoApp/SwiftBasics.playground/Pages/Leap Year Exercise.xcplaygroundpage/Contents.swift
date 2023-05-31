/*
 Name: Ankit Verma
 Topic: Exercise Leap Year
 */

/*
 Question:
 You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 was a leap year and 2016 will also be a leap year.
 The above rule is valid except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not also divisible by 400. For example 1900 was not a leap year, but 2000 was. Print Leap year! or Not a leap year! depending on the case.

 Input:
 var year = 2000

 Output:
 Leap year!
 */

func printLeapYearOrNot(year: Int) {
    assert(year >= 0, "Year cannot be negative!")
    if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                print("Leap Year")
            }
            else {
                print("Not a Leap Year!")
            }
        }
        else {
            print("Leap Year!")
        }
    } else {
        print("Not a Leap Year!")
    }
}

printLeapYearOrNot(year: 2000)
