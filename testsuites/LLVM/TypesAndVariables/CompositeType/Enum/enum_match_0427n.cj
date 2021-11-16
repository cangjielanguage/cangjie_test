// EXEC: %compiler %cmp_opt  %n.cj -o %output  2>&1 | compare %f
// ASSERT: regex-not stack trace

enum TimeUnit{
      Hour
      | Day(Int32,Int32)
}

func run(): Int64 {
    var time = TimeUnit.Day(2020,2022) @{       // EXPECTED: regex expected newline or ';' between expression or declaration
    var res: Int64 = match (time) {
        case $Hour => 2021
        case Day(x,y) => x+y
    }
    return res
}

func main(): Int64 {
    return run()
}
// ASSERT: regex-not core dumped

