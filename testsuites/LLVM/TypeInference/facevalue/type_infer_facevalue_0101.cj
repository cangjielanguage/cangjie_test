// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x: T): T { return x }

func main():Int64{
    var arr1 = @{1,2,3}
    var res = foo<Array<Int64>>(arr1).size
    if (res == 3) {
        return 0
    }
    return 1
}
