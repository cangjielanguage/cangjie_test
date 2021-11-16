// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Int64 = 0

func main(): Int64 {
    let fut1: Future<Int64> = spawn {
        sum
    }
    sleep(1000*1000*1000);
    return sum
}
