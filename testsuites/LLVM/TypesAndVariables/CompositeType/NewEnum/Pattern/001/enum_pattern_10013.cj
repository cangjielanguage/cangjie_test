// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : Result<Int64> = Ok(1)
    match (a){
        case $Ok(v) => v-1 // EXPECTED: regex expected '=>' after pattern in case body
        case Err(_) => 1
    }
}
