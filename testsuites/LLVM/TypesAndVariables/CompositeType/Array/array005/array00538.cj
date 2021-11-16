// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var c = 0
    let b = @{1,0}
    c = b[try {1} catch(_){1}]
    return c
}
