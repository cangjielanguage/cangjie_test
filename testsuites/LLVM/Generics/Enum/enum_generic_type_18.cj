// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

class A {
    var b: TimeUnit<Int32> = TimeUnit<Int32>.Day(14)
}

func run(): Int64 {
    var obj = A()
    var time = obj.b
    
    var res: Int32 = match (time) {
        case Day(x) => 2
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