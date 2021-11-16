// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func goo(){1}

external func foo(){
    var a = goo
    if(a()==1){
        return true
    }else{
        return false
    }
}

func main(): Int64 {
    if(foo()){
        return 0
    }else{
        return 1
    }
}
