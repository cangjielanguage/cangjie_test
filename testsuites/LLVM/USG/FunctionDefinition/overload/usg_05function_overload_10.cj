// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    func g(a: Sub) { print("1") }
}

class Sub <: Base {
    func g(a: Base) {
        print("2")
    }
}

func outer() {
    let s: Sub = Sub()
    s.g(Sub()) // Output: 1
}


func main() {
    outer()
    return 0
}
