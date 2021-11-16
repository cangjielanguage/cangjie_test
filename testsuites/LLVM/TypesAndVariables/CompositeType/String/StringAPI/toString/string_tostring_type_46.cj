// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:3

enum Time { Day(Int32) }

var time = Time.Day(14)
var a: Int32 = match (time) {
    case Day(x) => Int32(3)
}

func run(): Int64 {
    print("toStringTest:" + a.toString())
    return 0
}

func main(): Int64 {
    return run()
}