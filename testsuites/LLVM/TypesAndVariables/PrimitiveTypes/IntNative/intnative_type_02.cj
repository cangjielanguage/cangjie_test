// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( foo(1) != 2) {
        return 1
    }
    if ( goo(1) != 2) {
        return 2
    }
    return 0
}

func foo(a:IntNative,b!:IntNative=1):IntNative{
    return a+b
}

func goo(a:UIntNative,b!:UIntNative = 1):UIntNative{
    return a+b
}