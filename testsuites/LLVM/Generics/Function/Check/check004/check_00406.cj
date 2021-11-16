// DEPENDENCE: 401.cj 401.cfg
// EXEC: %compiler %cmp_opt -c 401.cj -o 401.%middle
// ERRCHECK: %compiler %cmp_opt %f -import-config 401.cfg 401.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan instantiation 'A<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'A<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'B<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'B<Generics-T,Generics-T>'
// ASSERT: scan instantiation 'C<Generics-T,Generics-T>' causes ambiguous functions named 'test' in declaration 'C<Generics-T,Generics-T>'

import test401.*

func test<T>(){
A<T,T>()
B<T,T>()
var c : C<T,T>
}

func main(): Int64 {
return 0
}
