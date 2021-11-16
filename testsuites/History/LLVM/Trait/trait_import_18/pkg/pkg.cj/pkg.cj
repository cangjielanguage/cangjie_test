// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.*

trait Num {
    func plus (a: This, b: This): This
    func ride (a: This, b: This): This
}

append Int32 with Num {
    func plus(a: Int32, b: Int32) {a + b}
    func ride(a: Int32, b: Int32) {a * b}
}

record A {}
append A with pkga.Num {
    func plus(a: A, b: A) : Int32 {3}
}

func run(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    var res: Int32 = plus(a,b)
    var resa: Int32 = ride(a,b)
    if (  res + resa ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
