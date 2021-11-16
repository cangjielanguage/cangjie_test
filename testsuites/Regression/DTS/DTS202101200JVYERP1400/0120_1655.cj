// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (foo1() != 1) {return 1}
    if (foo2()[2] != 1) {return 1} //失败
    return 0
}

func foo1(){
    var a = [-1,0,1]
    return a[2] // ok
}

func foo2(){
    var a = [-1,0,1]
    return a
}