// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Bool = true

func main(): Int64 {
    let fut1: Future<Bool> = spawn {
        sum = false && sum || !true
        return sum
    }
    sleep(1000*1000*1000);
    if (sum ) {
        return 1
    }
    return 0
}
