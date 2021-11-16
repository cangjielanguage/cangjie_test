// DEPENDENCE: a.cj b.cj 146.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c b.cj -o b.%middle
// ERRCHECK: %compiler %cmp_opt -import-config 146.cfg a.%middle b.%middle %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package c
import a.*
import b.*

func main():Int64{
let a = A.a // EXPECTED: regex there occurs type ambiguity about enum_decl on imported declaration 'A'
return 1
}
