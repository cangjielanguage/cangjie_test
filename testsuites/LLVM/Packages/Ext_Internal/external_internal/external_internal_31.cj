// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class A {
    static var a = 31
}

external func foo<T>() where T<: A{
    return T.a
} 

func main(): Int64 {
    if(foo<A>()==31){
        return 0
    }else{
        return 1
    }
}

