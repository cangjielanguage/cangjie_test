// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {}
class Sub <: Base {}

func outer() {
    func g(a: Sub) {
        print("1")
    }
    func inner() {
        func g(a: Base) {
            print("2")
        }
        g(Sub()) // Output: 2
    }
    inner()
}


func main():Int64{
    outer()
    return 0
}