// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal var b:Int64 = 2

external class A{
    public var a = b
}

func main(): Int64 {
    if(A().a==2){
        return 0
    }else{
        return 1
    }
}
