// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// random seed:1629934375190
// Int64[] -> Array<Int64>, Success -> Ok, Failure -> Err

func main(): Int64 {
    func func6<T0>() : Int64 {
        func func55<T0>() : UInt64 {
            return 0
        }

        return 0
    }

    func6<Int64>()

    return 0;
}
