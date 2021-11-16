// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var name: String = "Alice"
}
class Derived1 <: Base {
    var age: UInt8 = 18
}

func main(): Int64 {
    let base1: Base = Base()
    let base2: Base = Derived1()

    var test = base1 is Base
    if ( !test ) {
        return 1
    }
    test = base1 is Derived1
    if ( test ) {
        return 1
    }
    test = base2 is Base
    if ( !test ) {
        return 1
    }
    test = base2 is Derived1
    if ( !test ) {
        return 1
    }
    return 0
}