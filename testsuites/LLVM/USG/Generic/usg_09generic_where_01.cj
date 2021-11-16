// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    genericPrint<Int64>(10)
    return 0
}

func genericPrint<T>(a: T) where T<: ToString{
    print(a.toString())
}
