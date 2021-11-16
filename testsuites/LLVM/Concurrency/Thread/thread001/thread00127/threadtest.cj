// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum: Bool = true

func add(a: Bool, b: Bool): Bool {
    sum = a && b
    return sum
}

func main(): Int64 {
    let fut1: Future<Bool> = spawn {
        return add(true, false)
        add(true, true)
    }
    sleep(1000*1000*1000);
    if (sum ) {
        return 1
    }
    return 0
}
