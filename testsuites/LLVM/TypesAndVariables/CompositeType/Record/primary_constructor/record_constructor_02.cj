// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex-auto constructor Test is called

record Test {
    Test() {
        print("constructor Test is called")
    }
}


func main(): Int64{
    let res = Test()
    return 0
}
