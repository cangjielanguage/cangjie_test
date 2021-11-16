// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan anullc


func main() {
    var t = Throwable("null")
    print("a"+t.getMessage()+"c")
    return 0
}
