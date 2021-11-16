// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{}
interface B{}

interface X<T> where T <: A{}

interface Y<T> where T <: B{}

class Z <: X<A> &Y<B>{} // Z is not A,B`s child type.

class C<T> where T <: X<T>, T <: Y<T>{}


func main():Int64{
C<Z>() // EXPECTED: regex generics type arguments do not match the constraint
return 0
}
