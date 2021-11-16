// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj -import-config  cfg-ast pkga/pkga.o -o %output
// EXEC: %run %run_opt %output %run_args

package pkgc
import pkga.*

func run(): Int64 {
    let x: Fruit = Fruit()
    x.name = 1
    let y: Fruit = addcolor(x)
    if (y.name  == 51) {
       return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

