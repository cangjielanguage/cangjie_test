// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    A(let a : Int64) {}
    operator func + (inputA:A,inputB:A):Int64{
        return 0
    }
}

class C{
    let a : Int64
    operator func + (inputA:C,inputB:C):Int64{
        return 0
    }
    init(a:Int64){
        this.a = a
    }
}

interface I{
    let a : Int64 = 1
    operator func + (inputA:I,inputB:I):Int64{
        return 0
    }
}

class B <: I{}

func main():Int64{
    var a = A(1)
    var b = A(-1)
    var c = C(1)
    var d = C(-1)
    var e : I = B()
    return (a+b) + (c+d) + (e+e)
}
