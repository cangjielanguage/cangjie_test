// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan-begin dog run
// ASSERT: scan-next fox run

func main(): Int64 {
    var zoo: Zoo<Animal> = Zoo<Animal>()
    zoo.addAnimal(Dog())
    zoo.addAnimal(Fox())
    zoo.allAnimalRuns()
    return 0
}

abstract class Animal {
    func run(): String
}

class Dog <: Animal {
    func run() :  String {
        return "dog run"
    }
}

class Fox <: Animal{
    func run(): String {
        return "fox run"
    }
}

class Zoo<T> where T<: Animal {
    var animals: ArrayList<Animal> = ArrayList<Animal>()
    func addAnimal(a:T) {
        animals.add(a)
    }
    func allAnimalRuns(){
        for(a in animals) {
            print("${a.run()}\n")
        }
    }
}
