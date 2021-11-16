// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 7}

external class A{
    public func foo(x:Aoo):Aoo{
        return x
    }
}

func main(): Int64 {
    if(A().foo(Aoo()).value==7){
        return 0
    }else{
        return 1
    }
}
