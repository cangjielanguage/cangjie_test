// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/eee/e_01.cj -o eee.%middle
// EXEC: %compiler %cmp_opt -c src/ddd/d_01.cj eee.%middle -o ddd.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj ddd.%middle eee.%middle -o %output 2>&1 | compare %f

package aaa
import ddd.*

func main():Int64 {
    var a = foo() // EXPECTED: regex error.*?undeclared identifier 'foo'

    return 0
}
