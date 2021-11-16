// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 987654321


func test(): Int64 {
    var a : List<Int64> = [9,8,7,6,5,4,3,2,1]
    for (i in 0..a.size()) {
        print(a[i].toString())
    }
    return 0
}

func main(): Int64 {
    return test()
}
