// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R{
    operator func -():Int32{ 
        return 1
    }
//    operator func ++():Int32{ 
//        return 1
//    }
//    operator func --():Int32{ 
//        return 1
//    }
    operator func !():Int32{ 
        return 1
    }

}

class C{
    operator func -():Int32{ 
        return 1
    }
//    operator func ++():Int32{ 
//        return 1
//    }
//    operator func --():Int32{ 
//        return 1
//    }
    operator func !():Int32{ 
        return 1
    }

}


interface I{
    operator func -():Int32{ 
        return 1
    }
//    operator func ++():Int32{ 
//        return 1
//    }
//    operator func --():Int32{ 
//        return 1
//    }
    operator func !():Int32{ 
        return 1
    }

}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return 0
}
