// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal func goo(){44}

external class A{  
    private var a = goo
    func foo(){a}  
}

func main(): Int64 {
    if(A().foo()()==44){
        return 0
    }else{
        return 1
    }
}