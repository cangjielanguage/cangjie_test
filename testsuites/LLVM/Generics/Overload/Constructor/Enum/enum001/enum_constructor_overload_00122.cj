// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B{a(Int32)}

enum A{a(Int64)}

func main():Int64{
    var j = a(Int64(1))
    return 0
}