// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan num = 5\n

var result = 0..10

func main(): Int64 {
    let fut1: Future<Unit> = spawn {
        result = 0..5
    }
    sleep(1000*1000*1000);
    var num = 0
    for (i in result) {
        num = num + 1
    }
    if (num != 5 ) {
        return 1
    }
    print("num = ${num}\n")
    return 0
}
