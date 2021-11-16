// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Person {
    var height:Int32 = 180
    var weight:Int32 = 65
    var age = 0
    init(height:Int32) {
        this.height = height
    }
    init(height:Int32, age:Int32, weight:Int32) {
        this.height = height
        this.weight = weight
    }
    func growth():Unit {
        this.age++
    }
}
func main():Int64 {
    var person = Person(180,0,65)
    person.weight++
    person.height++
    person.growth()
    if( person.weight != 66 ){
        return 1
    }
    if( person.height != 181 ){
        return 1
    }
    if ( person.age != 1 ) {
        return 1
    }
    0
}