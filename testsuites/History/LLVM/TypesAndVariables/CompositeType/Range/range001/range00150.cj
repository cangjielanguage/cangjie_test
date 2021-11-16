// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
    let myRange = 1...10:1
}


func main(): Int64 {
    return 0
}
