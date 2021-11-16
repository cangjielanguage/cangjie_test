// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day(Int32) }

record test {
    test(let aaa : TimeUnit) {}
}

func run(): Int64 {
    let obj = test(TimeUnit.Day(14))
    let bbb = obj.aaa
    
    var res: Int32 = match (bbb) {
        case Day(x) => x + 2
    }  

    if (res == 16) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}