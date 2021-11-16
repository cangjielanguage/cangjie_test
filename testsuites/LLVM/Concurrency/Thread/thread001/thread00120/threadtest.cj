// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Int8 = 0

func add(a: Int8, b: Int8): Int8 {
    sum = a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Int8> = spawn {
        return add(1, 2)
        return add(3, 4)
    }
    sleep(1000*1000*1000);
    if (sum != 3 ) {
        return 1
    }
    return 0
}
