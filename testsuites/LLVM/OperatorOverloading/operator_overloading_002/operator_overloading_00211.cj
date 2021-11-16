// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    operator func *(inputB:R):Int64{
        return 1
    }
}

class C{
    operator func *(inputB:C):Int64{
        return 10
    }
}


interface I{
    operator func *(inputB:I):Int64{
        return 100
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    print("${a*a}")
    print("${c*c}")
    print("${r*r}")
    return Int64(a*a+c*c+r*r-111)
}

