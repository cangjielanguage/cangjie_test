// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan This is main\nThis is a new thread, sum = 3\nThis is a new thread, sum = 7\nsum = 7\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

func main(): Int64 {
    print("This is main\n")
    let fut: Future<Unit> = spawn {
        add(1, 2)
        let fut: Future<Int32> = spawn {
            add(3, 4)
        }
    }
    sleep(1000*1000*2000);
    print("sum = ${sum}\n")
    if (sum != 7 ) {
        return 1
    }
    return 0
}
