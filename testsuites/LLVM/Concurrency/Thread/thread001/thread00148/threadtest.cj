// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 1\n

var result: Int64 = 0

func x(input:Int64):Int64{input}

func main(): Int64 {
    let fut1: Future<Int64> = spawn {
        result = 1 |> ((x ~> x) ~> (x ~> x))
        return result
    }
    sleep(1000*1000*1000);
    if (result != 1 ) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
