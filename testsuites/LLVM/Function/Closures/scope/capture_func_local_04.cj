// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (foo() != 3){
        return 1
    }
    var m = foo
    if (m() != 3){
        return 1
    }
    if (goo() != 3){
        return 1
    }
    var n = goo
    if (n() != 3){
        return 1
    }
    return 0
}

func foo(){
    var a: Int32 = 1
    let b: Int32 = 2
    var y = a + b
    return y
}

func goo(){
    var a: Int32 = 1
    let b: Int32 = 2
    return a+b
}