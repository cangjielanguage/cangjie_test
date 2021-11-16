// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Float64 = 0.0

func add(a: Float64, b: Float64): Float64 {
    sum = a + b
    return sum
}

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Float64> = spawn {
        return add(1.1, 2.2)
        return add(3.3, 4.4)
    }
    sleep(1000*1000*1000);
    if (sum >= 3.30000000000001 || sum <= 3.29999999999999 ) {
        return 1
    }
    return 0
}
