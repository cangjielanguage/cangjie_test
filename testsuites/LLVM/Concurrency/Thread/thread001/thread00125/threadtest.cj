// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Float32 = 0.0

func add(a: Float32, b: Float32): Float32 {
    sum = a + b
    return sum
}

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Float32> = spawn {
        return add(1.1, 2.2)
        return add(3.3, 4.4)
    }
    sleep(1000*1000*1000);
    if (sum >= 3.300001 || sum <= 3.299999 ) {
        return 1
    }
    return 0
}
