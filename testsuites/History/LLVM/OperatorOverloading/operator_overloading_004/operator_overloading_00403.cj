// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    A(let a : Int32) {}
    operator func + (inputA:A,inputB:A):Bool = true
}

class C{
    let a : Int32
    operator func + (inputA:C,inputB:C):Bool = true
    init(a : Int32){
        this.a = a
    }
}

interface I{
    let a : Int32 = 1
    operator func + (inputA:I,inputB:I):Bool = true
}

class B <: I{}

func main():Int64{
    let a = A(1)
    let b : I = B()
    let c = C(1)
    if a+a && b+b && c+c {
        return 0
    }
    return 1
}
