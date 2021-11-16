// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : Result<Int64> = Ok(1)
    match (a){
        case $Ok => 0 // EXPECTED: regex undeclared identifier 'Ok'
        case Err(_) => 1
    }
}
