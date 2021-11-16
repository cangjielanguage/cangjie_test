// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = if (true) {1}else{2}..if (true) {10}else{0}:if (true) {1}else{0}
    return 0
}
