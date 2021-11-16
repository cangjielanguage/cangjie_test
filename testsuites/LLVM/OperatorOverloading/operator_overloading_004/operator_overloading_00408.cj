// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record A{
    let a : Int32
    operator func + (inputB:A):A // EXPECTED: regex function declaration must have function body
}

class C{
    let a : Int32
    operator func + (inputB:C):C // EXPECTED: regex-auto function '+' can not be abstract
    init(a : Int32){
        this.a = a
    }
}

interface I{
    let a : Int32 = 1
    operator func + (inputB:I):I
}

class B <: I{} // EXPECTED: regex-auto class 'B' missing abstract modifier or abstract function '+' should be implemented

func main():Int64{
    var a = A(1)
    var b = A(-1)
    var c = C(1)
    var d = C(-1)
    var e : I = B()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
