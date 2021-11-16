// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a1: IntNative = -1
var b1: UIntNative = 0

func main():Int64 {
    var a = foo<IntNative>(a1)
    var b = foo<UIntNative>(b1)
    if ( a != -1 ){
        return 1
    }
    if ( b != 0 ){
        return 2
    }
    return 0
}

func foo<T>(x:T){
    return x
}
