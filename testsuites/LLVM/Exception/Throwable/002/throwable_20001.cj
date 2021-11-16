// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex catch!java.lang.ArithmeticException: / by zero|Exception RuntimeException ArithmeticException Divided by zero
// ASSERT: scan throwable_20001.cj:9)

func main() {
    var n = 2
    var res = 3
    try { n = n / (n-2) }
    catch (e:ArithmeticException){print("catch!");e.printStackTrace()}
    finally {res = 0}
    return res
}
