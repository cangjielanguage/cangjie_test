// DEPENDENCE: A.cj B.cj
// EXEC: %compiler %cmp_opt -c A.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c B.cj -o b.%middle
// EXEC: %compiler %cmp_opt %n.cj a.%middle b.%middle -o %output 2>&1 | compare %f

import A.*
import B.*

extend Foo <: Bar {}    // EXPECTED: regex imported type 'Foo' cannot extend import interface
func main() {
    return 0
}