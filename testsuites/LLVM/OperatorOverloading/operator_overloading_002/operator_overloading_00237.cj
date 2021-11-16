// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    operator func *(inputB:R):Int32{
        return 1
    }
}

class C{
    operator func *(inputB:C):Int32{
        return 10
    }
}


interface I{
    operator func *(inputB:I):Int32{
        return 100
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return Int64(a*a+c*c+r*r-111)
}
