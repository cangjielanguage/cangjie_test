// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func foo1(){
    var a = foo2()
    return a
}

external func foo2(){
    return 0
}

func main(): Int64 {
    return foo1()
}
