// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var num: Int32 = 0

func add(): Unit {
    num = num + 1
    if (num < 200 ) {
        let fut: Future<Unit> = spawn { add() }
    }
}

func main(): Int64 {
    let fut: Future<Unit> = spawn { add() }
    sleep(1000*1000*1000);
    if (num != 200 ) {
        return 1
    }
    return 0
}
