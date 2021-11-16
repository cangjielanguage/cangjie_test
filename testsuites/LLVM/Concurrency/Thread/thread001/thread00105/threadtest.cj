// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var num: Int32 = 0

func add(): Unit {
    num = num + 1
}

func main(): Int64 {
    let times: Int32 = 10
    for (i in 0..times) {
        let fut: Future<Unit> = spawn { add() }
        sleep(1000*1000)
    }
    if (num != times ) {
        return 1
    }
    return 0
}
