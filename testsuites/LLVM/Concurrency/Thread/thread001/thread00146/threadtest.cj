// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Int32 = 0

func main(): Int64 {
    let fut1: Future<Int32> = spawn {
        sum = sum + 1
        let f = {
            input: Int32 =>
            sum = input + 1
            print("This is a new thread, sum = ${sum}\n")
        }
        f(sum)
        return sum
    }
    sleep(1000*1000*1000);
    if (sum != 2 ) {
        return 1
    }
    return 0
}
