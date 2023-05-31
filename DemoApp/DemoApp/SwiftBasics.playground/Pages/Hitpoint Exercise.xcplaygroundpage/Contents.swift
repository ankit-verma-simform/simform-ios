/*
 Name: Ankit Verma
 Topic: Exercise Hitpoints
 */

/*
 Question:
 You are working on a videogame where the character has a certain number of hitpoints(HP) ranging from 0 to 100.
  100 represents full health
  0 represents dead.
 You want to add regenerating health to the game using the following rules:

 HP always regenerates up to numbers of the form X0 (75 -> 80 , 32 -> 40 …)

 When HP is below 20 it regenerates up to 20 (13 -> 20, 5 -> 20, …)

 If the character has 0 HP then he doesn’t regenerate life (he’s dead)

 Given the current hp of the character stored in a variable hp print the hp the player will have after regenerating life.

 Input:
 var hp = 60

 Output:
 60
 */

func regenerateHealth(hp: Int) -> Int {
    assert(hp >= 0, "HP is a non negative value!")
    assert(hp <= 100, "HP can't be more than 100!")
    switch hp {
    case 0:
        return 0
    case 1...20:
        return 20
    case let hp where hp % 10 == 0:
        return hp
    default:
        return (hp / 10 + 1) * 10
    }
}

print(regenerateHealth(hp: 60))
