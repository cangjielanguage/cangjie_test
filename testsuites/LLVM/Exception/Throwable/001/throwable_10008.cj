// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ac


func main() {
    var t = Throwable("")
    print("a"+t.getMessage()+"c")
    return 0
}
