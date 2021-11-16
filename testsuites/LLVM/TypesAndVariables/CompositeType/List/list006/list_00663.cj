// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 123

func test(): Int64 {
    var a = [1,2,3]
    var b = a.toArray()
    for (i in b) {
        print(i.toString())
    }
    return 0
}

func main(): Int64 {
    test()
}
