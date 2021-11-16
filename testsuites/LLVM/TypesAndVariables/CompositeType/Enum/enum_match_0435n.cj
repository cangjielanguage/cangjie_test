// EXEC: %compiler %cmp_opt  %n.cj -o %output  2>&1 | compare %f
// ASSERT: regex-auto all enum constructors must be covered in match

enum TimeUnit1 {
      Hour
      | Day(Int32,Int32)

}
enum TimeUnit2 {
       Month(TimeUnit1)
}

func run(): Int64 {
    var time = TimeUnit2.Month(TimeUnit1.Hour)
    var res: Int32 = match (time) {
        case Month(Day(x,y)) => x+y
    }

    return 1
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
