// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type fun<T> = (T)->T

func foo(x: Int32): Int32{
    return x
}

func bar(x: fun<Int32>): Int32 {
    return x(3)
}

func main(): Int64 {
    var func1: fun<Int32> = foo
    var func2: (fun<Int32>)->Int32 = bar
    var res: Int32 = func2(func1)
    if (res == 3) {
        return 0
    }
    return 1
}