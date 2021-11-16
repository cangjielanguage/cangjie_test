// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

record test {
    test(let a: TimeUnit) {}
}

func main(): Int64 {
    var time = TimeUnit.Day

    let newTest = test(time)

    let newA = newTest.a

    var res: Int32 = match (newA) {
        case $Day => 2
    }

    if (res == 2) {
        return 0
    }
    return 1
}
