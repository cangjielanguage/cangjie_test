// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex An exception has already occurred


func main() {
    var t = Throwable("test")
    t.printStackTrace()
    return 0
}
