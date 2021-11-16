// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{ interface B {} }  // EXPECTED: regex interface type must be toplevel

class C <: A.B{}

func test<A>(a:A){}

func main(){
    var a : A.B = C()
    test<A.B>(C())
    test<A.B>(a)
    return 0
}
