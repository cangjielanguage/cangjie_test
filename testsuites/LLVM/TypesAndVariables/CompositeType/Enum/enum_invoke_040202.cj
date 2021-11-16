// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 

enum TimeUnit1 { Year(Int32) }
enum TimeUnit2 { Year(Int32) }

func run(): Int64 {
    var time1 = TimeUnit1.Year(2020) 
    var time2 = TimeUnit2.Year(2022) 
    var res: Int32 = match (time1) {
        case Year(x) => x
    }
    res = match (time2) {
        case Year(x) => x
    }

    if (res == 2022) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
