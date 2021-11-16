// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let core = 16 // cpu core
var sum: Int64 = 0

func add(input: Int64): Unit {
    sum = sum + 1
    while (sum < core) {
        if ((input + 1 == core) ) {
            sum = core
            sleep(1000*1000*2000)
        }
    }
}

func main(): Int64 {
    for (i in 0..core) {
        let fut: Future<Unit> = spawn { add(i) }
        sleep(-9223372036854775808);
    }
    print("sum = ${sum}")
    if (sum != core ) {
        return 1
    }
    return 0
}
