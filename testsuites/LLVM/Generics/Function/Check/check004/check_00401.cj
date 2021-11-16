// DEPENDENCE: 401.cj 401.cfg
// EXEC: %compiler %cmp_opt -c 401.cj -o 401.%middle
// ERRCHECK: %compiler %cmp_opt %f -import-config 401.cfg 401.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64,Int64>'
// ASSERT: scan instantiation 'B<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'B<Int64,Int64>'
// ASSERT: scan instantiation 'C<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'C<Int64,Int64>'

import test401.*

class Z<a,b,c> where
a <: test401.A<Int64,Int64> ,
b <: test401.B<Int64,Int64> ,
c <: test401.C<Int64,Int64> {}

func main(): Int64 {
return 0
}
