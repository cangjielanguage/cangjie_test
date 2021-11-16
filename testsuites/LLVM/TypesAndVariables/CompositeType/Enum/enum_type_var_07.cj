// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

class A {
    var b: TimeUnit = TimeUnit.Day
}

func run(): Int64 {
    var obj = A()
    var time = obj.b
    
    var res: Int32 = match (time) {
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