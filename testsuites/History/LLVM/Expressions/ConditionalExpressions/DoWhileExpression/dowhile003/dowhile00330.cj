// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{let test:Int32 = 1}

func main(): Int64 {
    while true {
        A.test
        return 0
    }
    return 1
}