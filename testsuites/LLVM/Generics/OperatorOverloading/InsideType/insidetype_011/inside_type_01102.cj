// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A<X,Y>{
    operator func *(b:A<X,Y>):Bool  {true} // EXPECTED: regex causes ambiguous functions
    operator func *(b:A<X,Y>):Bool  {true} // EXPECTED: regex causes ambiguous functions
    operator func *(b:A<X,Y>):Bool  {true}
}

record B<X,Y>{
    operator func *(b:B<X,Y>):Bool  {true} // EXPECTED: regex causes ambiguous functions
    operator func *(b:B<X,Y>):Bool  {true} // EXPECTED: regex causes ambiguous functions
    operator func *(b:B<X,Y>):Bool  {true}
}

interface C<X,Y>{
    operator func *(b:C<X,Y>):Bool  {true} // EXPECTED: regex causes ambiguous functions
    operator func *(b:C<X,Y>):Bool  {true} // EXPECTED: regex causes ambiguous functions
    operator func *(b:C<X,Y>):Bool  {true}
}

class D <: C<Int8,Int8>{}



func main(): Int64 {
    var a : A<Int8,Int8> = A<Int8,Int8>()
    var b : B<Int8,Int8> = B<Int8,Int8>()
    return 0
}
