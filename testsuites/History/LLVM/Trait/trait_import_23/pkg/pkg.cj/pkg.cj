// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.*

var Num : Int32 = 3

record A {}
append A with pkga.Num {
    func plus(a: A, b: A) : Int32 {2}
}

func run(): Int64 {
    var res = Num
    var resa: Int32 = plus(A(), A())
    if (  res + resa ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
