// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 123456789


func test(): Int64 {
    var a : List<Int64> = [1,2,3,4,5,6,7,8,9]
    for (i in 0..a.size()) {
        print(a[i].toString())
    }
    return 0
}

func main(): Int64 {
    return test()
}
