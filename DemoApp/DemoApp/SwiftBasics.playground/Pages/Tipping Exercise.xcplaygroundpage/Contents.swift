/*
 Name: Ankit Verma
 Topic: Exercise Tipping
 */

/*
 Question:
 You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
 You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
 Print the total cost of the meal.

 Input:
 var mealCost:Double = 3.5
 var tip:Int = 20

 Output:
 4.2
 */

func calcTotalCost(mealCost: Double, tip: Int) -> Double {
    assert(mealCost >= 0, "Meal cost can't be negative!")
    assert(tip >= 0, "Tip percentage can't be negative!")
    return (1 + Double(tip)/100) * mealCost
}

var mealCost:Double = 3.5
var tip:Int = 20
print(calcTotalCost(mealCost: mealCost, tip: tip))
