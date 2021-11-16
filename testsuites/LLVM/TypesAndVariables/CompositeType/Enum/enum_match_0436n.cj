// EXEC: %compiler %cmp_opt  %n.cj -o %output  2>&1 | compare %f

enum TimeUnit{
      Hour
      | Day(Int32,Int32)

}

func run(): Int64 {
    var time = TimeUnit.Day(2020,2022)
    var res: Int32 = match (time) {
        case $Hour => 2021
        case Day(x,y,z) => x+y+z // EXPECTED: regex enum pattern's parameters size is wrong
    }

    return 1
}

func main(): Int64 {
    return run()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
