// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : Result<Int64> = Err(1) // EXPECTED: regex parameters and arguments mismatch
    match (a) {
        case Ok(v) => 1
        case Err(_) => 0
    }
}
