// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type Int32ToStr = (Int32)->String

func foo(x: Int32): String{
    return x.toString()
}

func bar(x: Int32ToStr): String{
    return x(3)
}

func main(): Int64 {
    var func1: Int32ToStr = foo
    var func2: (Int32ToStr)->String = bar
    var res: String = func2(func1)
    if (res == "3") {
        return 0
    }
    return 1
}