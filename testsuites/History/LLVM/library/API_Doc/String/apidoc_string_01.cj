// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return 0
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

external class Aoo{
    var a: Boo*Coo = (Boo(),Coo())
}

external class Boo{

}

internal class Coo{
    var a = 1
}

external class A{
    var a = B.foo
}

