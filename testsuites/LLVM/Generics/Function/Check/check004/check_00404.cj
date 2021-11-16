// DEPENDENCE: 404.cj 404.cfg
// EXEC: %compiler %cmp_opt -c 404.cj -o 404.%middle
// ERRCHECK: %compiler %cmp_opt %f -import-config 404.cfg 404.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'A<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'B<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'B<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'C<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'C<Generics-T,Generics-T>'

import test404.*

func test<T>(input:T){
A<T,T>.test(1,1,input)
B<T,T>.test(1,1,input)
C<T,T>.test(1,1,input)
}

func main(): Int64 {
return 0
}
