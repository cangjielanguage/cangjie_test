// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : Result<Int64> = Ok(1)
    match (a){
        case Some(v) => v-1 // EXPECTED: regex undeclared identifier 'Some'
        case $None => 1
    }
}
