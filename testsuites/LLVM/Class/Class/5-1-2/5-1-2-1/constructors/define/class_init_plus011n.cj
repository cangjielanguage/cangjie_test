// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    return run()
}

class Day {
    let t1 :Int32 = 1
    let t2 :Int64 = 2
    let t4 :Int32
    t4 = 4 // EXPECTED: regex illegal class member in class block
    var v1 :Int32 = 5
    var v2 :Int64 = 6
    var v4 :Int32
    v4 = 8 // EXPECTED: regex illegal class member in class block
}

func run(): Int64 {
   var day :Day = Day()
   return 0
}
