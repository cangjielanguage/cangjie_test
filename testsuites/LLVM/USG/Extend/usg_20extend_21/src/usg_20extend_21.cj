// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt src/%n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package B
import A.*

func main() {
    let a = Foo()
    a.g() // ok
    return 0
}

