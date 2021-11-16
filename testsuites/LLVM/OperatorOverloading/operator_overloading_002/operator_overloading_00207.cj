// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    operator func !():Int64{
        return 1
    }
}

class C{
    operator func !():Int64{
        return 2
    }
}


interface I{
    operator func !():Int64{
        return 3
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return !a + !c + !r -6
}
