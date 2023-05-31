/*
 Name: Ankit Verma
 Topic: Exercise Above Average
 */

/*
 Question:
 You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 of typeDouble.
 You are also given your grade in the class stored in a variable yourGrade of type Double.
 Print above average if your grade is greater than the class average or below average” otherwise.
  Note: the average of the class includes your grade.

 Input:
 var grade1 = 7.0
 var grade2 = 9.0
 var grade3 = 5.0
 var yourGrade = 8.0

 Output:
 "above average"
 */

func printIfAboveAverageOrNot(
    grade1: Double,
    grade2: Double,
    grade3: Double,
    yourGrade myGrade: Double) {
        assert(grade1 >= 0 && grade2 >= 0 && grade3 >= 0 && myGrade >= 0,
               "Grades can't be negative")
        
        let classAverage = (grade1 + grade2 + grade3 + myGrade) / 4
        myGrade > classAverage ? print("Above average") : print("Average or Below average")
}

printIfAboveAverageOrNot(grade1: 7.0, grade2: 9.0, grade3: 5.0, yourGrade: 8.0)
