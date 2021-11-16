// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func goo(){3}

external func foo(){
    var a = goo
    return a
}

func main(): Int64 {
    if(foo()()==3){
        return 0
    }else{
        return 1
    }
}
