// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

trait X{}

func test<T>() where This <: X{} // EXPECTED: regex-auto 'This' is keyword not identifier, you can use '`This`' instead

record R<T> where This <: X{} // EXPECTED: regex-auto 'This' is keyword not identifier, you can use '`This`' instead

enum E<T> where This <: X{e} // EXPECTED: regex-auto 'This' is keyword not identifier, you can use '`This`' instead

class C<T> where This <: X{} // EXPECTED: regex-auto 'This' is keyword not identifier, you can use '`This`' instead

interface I<T> where This <: X{} // EXPECTED: regex-auto 'This' is keyword not identifier, you can use '`This`' instead

append<T> R<T> with X where This <: X{}  // EXPECTED: regex-auto 'This' is keyword not identifier, you can use '`This`' instead

func main():Int64{
    return 1
}
