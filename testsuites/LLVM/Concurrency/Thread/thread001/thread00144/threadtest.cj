// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Int32 = 0

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Int32> = spawn {
        sum = sum >> 2 << 1 ^ 2 & 11 | 7
        print("This is a new thread, sum = ${sum}\n")
        return sum
    }
    sleep(1000*1000*1000);
    if (sum != 7 ) {
        return 1
    }
    return 0
}
