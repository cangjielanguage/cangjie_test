// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    operator func +(inputB:R):Int64{
        return -1
    }
}

class C{
    operator func +(inputB:C):Int64{
        return -10
    }
}


interface I{
    operator func +(inputB:I):Int64{
        return -100
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    var res1 = a+a
    var res2 = c+c
    //var res6 = r+r
    //return (+a)+(a+a) + (+c)+(c+c) + (+r)+(r+r)
    return 0
}
