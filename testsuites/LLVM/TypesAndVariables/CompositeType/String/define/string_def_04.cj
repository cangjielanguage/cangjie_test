// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

let str1 = "Hello Char Lang"
let str2 = str1

func run(): Int64 {
    print("StringTest: " + str2)
    return 0
}

func main(): Int64 {
    return run()
}