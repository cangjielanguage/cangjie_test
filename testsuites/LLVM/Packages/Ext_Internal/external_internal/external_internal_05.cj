// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func foo5(){
    return 0
}
external var foo=foo5

func main(): Int64 {
    return foo()
}
