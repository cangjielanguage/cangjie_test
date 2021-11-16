// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait X{}
trait Y{}

func test<T1,T2,T3>() where X <: Y{} // EXPECTED: regex 'X' is not a type

record R<T1,T2,T3> where X <: Y{} // EXPECTED: regex 'X' is not a type

enum E<T1,T2,T3> where X <: Y{e} // EXPECTED: regex 'X' is not a type

class C<T1,T2,T3> where X <: Y{} // EXPECTED: regex 'X' is not a type

interface I<T1,T2,T3> where X <: Y{} // EXPECTED: regex 'X' is not a type

trait R_X{}
append<T1,T2,T3> R<T1,T2,T3> with R_X where X <: Y{} // EXPECTED: regex 'X' is not a type

func main():Int64{
return 0
}
