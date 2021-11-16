// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex The value of index is 0: 50.000000
// ASSERT: regex The value of index is 1: 50.000000
// ASSERT: regex The value of index is 2: 50.000000
// ASSERT: regex The value of index is 3: 50.000000
// ASSERT: regex The value of index is 4: 50.000000
// ASSERT: regex The value of index is 5: 50.000000
// ASSERT: regex The value of index is 6: 50.000000
// ASSERT: regex The value of index is 7: 50.000000
// ASSERT: regex The value of index is 8: 50.000000
// ASSERT: regex The value of index is 9: 50.000000



func main(): Int64 {
    var listf64: ListFloat64 = ListFloat64(10,50.0)
    var index: Int64 = 0
    while (index < 10) {
        var tmp: Float64 = listf64.get(index)
        print("The value of index is ${index}: "+tmp.toString()+"\n")
        index = index + 1
    }

    return 0
}
