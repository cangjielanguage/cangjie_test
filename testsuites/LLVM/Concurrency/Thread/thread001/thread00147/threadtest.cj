// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var result: Int64 = 0

func f(input:Unit):Int64{100}

func main(): Int64 {
    let fut1: Future<Int64> = spawn {
        result = (result = 0) |> f
        return result
    }
    sleep(1000*1000*1000);
    if (result != 100 ) {
        return 1
    }
    return 0
}
