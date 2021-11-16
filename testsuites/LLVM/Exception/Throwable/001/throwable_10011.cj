// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan a1c


func main() {
    var a = 1
    var t = Throwable("${a}")
    print("a"+t.getMessage()+"c")
    return 0
}
