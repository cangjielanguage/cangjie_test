// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func goo(){5}

external func foo(x!:()->Int64=goo){
    return x
}

func main(): Int64 {
    if(foo()()==5){
        return 0
    }else{
        return 1
    }
}
