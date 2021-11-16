// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan cangjie

var sum: String = ""

func add(a: String, b: String): String {
    sum = a + b
    return sum
}

func main(): Int64 {
    let fut1: Future<String> = spawn {
        return add("cang", "jie")
        return add("仓", "颉")
    }
    sleep(1000*1000*1000);
    print(sum)
    return 0
}
