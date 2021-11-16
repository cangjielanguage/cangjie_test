// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    operator func -():Int64{
        return 1
    }
    operator func -(inputB:R):Int64{
        return -1
    }
}

class C{
    operator func -():Int64{
        return 10
    }
    operator func -(inputB:C):Int64{
        return -10
    }
}


interface I{
    operator func -():Int64{
        return 100
    }
    operator func -(inputB:I):Int64{
        return -100
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    //return (-a)+(a-a) + (-c)+(c-c) + (-r)+(r-r)
    return (-a)+(a-a) + (-c)+(c-c)
}
