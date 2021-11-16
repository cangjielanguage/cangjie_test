// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

trait X{}


func test<T>() where T <: X,{} // EXPECTED: regex expected identifier here

record R<T> where T <: X,{} // EXPECTED: regex expected identifier here

enum E<T> where T <: X,{e} // EXPECTED: regex expected identifier here

class C<T> where T <: X,{} // EXPECTED: regex expected identifier here

interface I<T> where T <: X,{} // EXPECTED: regex expected identifier here

append<T> R<T> with X where T<:X,{}  // EXPECTED: regex expected identifier here

func main():Int64{
    return 1
}
