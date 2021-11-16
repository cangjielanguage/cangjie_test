// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex charTest: a

let c1 = 'a'
let c2 = c1

func run(): Int64 {
    print("charTest: " + c2.toString())
    return 0
}

func main(): Int64 {
    return run()
}