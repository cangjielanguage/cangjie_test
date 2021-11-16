// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var bar: (Int64, Unit)->Unit = {x: Int64, y:Unit =>
    var a = x
    a **= 3
}

var foo:(Int64,Unit)->Int64 = {x: Int64, y:Unit =>
    var a = x
    a **= 3
    a
}

func main(): Int64 {
    var res1 = foo(3, ())
    var res2 = bar(3, ())
    if (res1 == 27 && res2 == () ){
        return 0
    }
    return 1
}