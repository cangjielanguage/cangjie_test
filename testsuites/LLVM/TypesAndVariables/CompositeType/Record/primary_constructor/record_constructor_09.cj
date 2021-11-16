// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex-auto constructor is called

record Test {
    let a: Int32 = 1
    let b: Int32 = 2
    Test() {
      print("constructor is called")
    }
}

func main(): Int64 {
    let res = Test()
    return 0
}

