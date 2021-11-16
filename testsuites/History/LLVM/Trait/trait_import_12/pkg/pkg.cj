// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o -import-config  cfg-ast -o %output
// EXEC: %output

package pkg
import pkga.Num as A

append Int32 with A {
    func plus(a: Int32, b: Int32) {a + b}
}

func run(): Int64 {
    var res: Int32 = plus(1,2)
    if ( res ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
