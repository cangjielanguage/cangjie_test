// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Int64*Int64 = (0, 0)

func add(a: Int64, b: Int64): Int64*Int64 {
    sum = (a, b)
    return sum
}

func main(): Int64 {
    let fut1: Future<Int64*Int64> = spawn {
        add(1, 2)
        return (2, 3)
        add (3, 4)
    }
    sleep(1000*1000*1000);
    if (sum != (1, 2) ) {
        return 1
    }
    return 0
}
