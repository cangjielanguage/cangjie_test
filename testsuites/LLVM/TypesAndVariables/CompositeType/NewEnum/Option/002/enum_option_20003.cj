// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    try {} catch (_:?Int64){} // EXPECTED: regex the exception catch type must be class and extends from core.Throwable
    return 0
}
