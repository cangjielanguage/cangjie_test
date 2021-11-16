// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

record test1 {
    test1(let aaa : TimeUnit) {}
}

func run(): Int64 {
    let obj = test1(TimeUnit.Day)
    let aaa1 = obj.aaa
    
    var res: Int32 = match (aaa1) {
        case $Day => 2
    }  

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}