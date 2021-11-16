// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    if foo1() != 0 {return 1}
    return 0
}

enum TimeUnit1 { Year(Int32) | Day(TimeUnit1)}
enum TimeUnit1_2 { Year(Int64) | Day(TimeUnit1_2)}

func foo1(){
    var b = Day(Year(1)) // EXPECTED: regex find multiple constructor 'Day' of enum declaration
    var n:Int32 = 1
    var c = Day(Year(n))
    var a = match b {
        case Day(Year(y)) => 0
        case _ => 2
    }
    a
}

