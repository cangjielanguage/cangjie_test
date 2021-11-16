// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: UInt64 = 0

func add(a: UInt64, b: UInt64): UInt64 {
    sum = a + b
    return sum
}

func main(): Int64 {
    let fut1: Future<UInt64> = spawn {
        return add(1, 2)
        return add(3, 4)
    }
    sleep(1000*1000*1000);
    if (sum != 3 ) {
        return 1
    }
    return 0
}
