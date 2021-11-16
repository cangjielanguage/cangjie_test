// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

internal class Data {
    var a: Int64 = 5
}

func run(): Int64 {
    var value : Data = Data()
    return value.a - 5
}

func main(): Int64 {
    return run()
}
