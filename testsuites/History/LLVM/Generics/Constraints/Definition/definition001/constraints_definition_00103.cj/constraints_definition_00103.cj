// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

trait X{}

func test<T>() where Y <: X{} // EXPECTED: regex-auto generics type variable 'Y' has not defined

record R<T> where Y <: X{} // EXPECTED: regex-auto generics type variable 'Y' has not defined

enum E<T> where Y <: X{e} // EXPECTED: regex-auto generics type variable 'Y' has not defined

class C<T> where Y <: X{} // EXPECTED: regex-auto generics type variable 'Y' has not defined

interface I<T> where Y <: X{} // EXPECTED: regex-auto generics type variable 'Y' has not defined

append<T> R<T> with X where Y <: X{}  // EXPECTED: regex-auto generics type variable 'Y' has not defined

func main():Int64{
    return 1
}
