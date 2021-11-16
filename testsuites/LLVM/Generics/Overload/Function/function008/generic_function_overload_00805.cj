// DEPENDENCE: a.cj c.cj  c.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c c.cj -o c.%middle
// ERRCHECK: %compiler %cmp_opt  a.%middle c.%middle %f -o %output
// ASSERT:scan-not core dumped
package pkg801
import a.*
import c.*

func main():Int64{
    var I = test(1) // EXPECTED: regex ambiguous match for function call
    return 0
}