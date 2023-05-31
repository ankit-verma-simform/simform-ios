/*
 Name: Ankit Verma
 Topic: Exercise
 */

/*
 Question:
 You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoil after 3 weeks (21 days) and bacon after one week (7 days).
 Given baconAge and eggsAge(in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
 If you can cook bacon and eggs print you can cook bacon and eggs.
 If you need to throw out any ingredients for each one print a line with the text throw out <ingredient> (where <ingredient> is bacon or eggs) in any order.

 Input:
 var baconAge = 3
 var eggsAge = 2

 Output:
 you can cook bacon and eggs
 */

func canCookOrThrowIngredients(baconAge: Int, eggsAge: Int) {
    let daysForEggToSpoil = 21
    let daysForBaconToSpoil = 7
    var spoiledIngredients = false
    
    if baconAge > daysForBaconToSpoil {
        print("throw out bacon")
        spoiledIngredients = true
    }
    if eggsAge > daysForEggToSpoil {
        print("throw out eggs")
        spoiledIngredients = true
    }
    
    if !spoiledIngredients {
        print("you can cook bacon and eggs")
    }
}

canCookOrThrowIngredients(baconAge: 3, eggsAge: 2)
