// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func test(x!:IntNative = 1):IntNative{
    return x
}

func main() {
    var res = test()
    print("${res}")
    return 0
}
