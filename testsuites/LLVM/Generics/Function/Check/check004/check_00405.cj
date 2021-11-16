// DEPENDENCE: 404.cj 404.cfg
// EXEC: %compiler %cmp_opt -c 404.cj -o 404.%middle
// ERRCHECK: %compiler %cmp_opt %f -import-config 404.cfg 404.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64,Int64>'
// ASSERT: scan instantiation 'B<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'B<Int64,Int64>'
// ASSERT: scan instantiation 'C<Int64,Int64>' causes ambiguous functions named 'test' in declaration 'C<Int64,Int64>'

import test404.*

func test(){
A<Int64,Int64>.test(1,1,1)
B<Int64,Int64>.test(1,1,1)
C<Int64,Int64>.test(1,1,1)
}

func main(): Int64 {
return 0
}
