// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var x = A(1)
    var y = B(1)
    var b:A = foo(y) // EXPECTED: regex error.*?ambiguous match for function call 'foo'
    return 0
}

open class A {
    var a:Int32 = 10
    init(x:Int32){ a = x + 1 }
}

class B <: A {
    var b:Int32 = 20
    init(x:Int32){
        super(x)
        b = x
    }
}


func foo(x:A):A{return x} // EXPECTED: regex found candidate
func foo(x:A,y!:A=A(0)):A{return B(0)} // EXPECTED: regex found candidate
func foo(x:A,y!:B=B(0)):B{return B(0)} // EXPECTED: regex found candidate

func foo(x:B):A{return A(1)} // EXPECTED: regex found candidate
func foo(x:B,y!:A=A(0)):A{return B(1)} // EXPECTED: regex found candidate
func foo(x:B,y!:B=B(0)):B{return B(1)} // EXPECTED: regex found candidate
