// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    let r : Int32
    init(x:Int32) {
        r = x
    }
    operator func --(inputA:R):R{
        return R(inputA.r - 1)
    }
}

class C{
    var c : Int32
    init(x:Int32) {
        c = x
    }
    operator func --(inputA:C):C{
        inputA.c = inputA.c - 1
        return inputA
    }
}


interface I{
    let i : Int32 = 1
    operator func --(inputA:I):Bool{
        return true
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C(1)
    var r = R(1)
    r = r--
    c--
    if a-- {
        return Int64(r.r + c.c)
    }
    return 1
}
