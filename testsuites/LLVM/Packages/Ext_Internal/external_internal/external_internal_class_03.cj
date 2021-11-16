// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func goo(){3}

external class A{
    public var a = goo
}

func main(): Int64 {
    if(A().a()==3){
        return 0
    }else{
        return 1
    }
}
