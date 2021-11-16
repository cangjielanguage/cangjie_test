// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    func foo(a ! : Int64 = (1,2)[0]) : Int64 {
        1
    }
    return 0;
}

