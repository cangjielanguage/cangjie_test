// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 5}

external class A{
    public var a:Aoo = Aoo()
}

func main(): Int64 {
    if(A().a.value==5){
        return 0
    }else{
        return 1
    }
}
