// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external var b:Int64 = 1

external class A{
    public var a = b
}

func main(): Int64 {
    if(A().a==1){
        return 0
    }else{
        return 1
    }
}
