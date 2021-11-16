// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex  'enum' is keyword not identifier

enum TimeUnit<T> {
    Month(T) | Day(T)
}

trait Num {
    func plus(a: This, b: This): This
}

append enum with Num {
    func plus(a: TimeUnit<Int64>, b: TimeUnit<Int64>): TimeUnit<Int64> { b }
}

func run(): Int64 {
    let time = plus(TimeUnit.Month(5) , TimeUnit.Day(5))
    var res: Int64 = match (time) {
        case $Month => 1
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