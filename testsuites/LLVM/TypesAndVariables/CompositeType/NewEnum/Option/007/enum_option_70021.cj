// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    e
    prop let a : ?Int64{
        get (){None}
    }
}

func main(): Int64 {
    e.a ?? 0
}