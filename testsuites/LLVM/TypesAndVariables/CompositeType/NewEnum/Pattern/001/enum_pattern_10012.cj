// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Result<Int64> = Ok(1)
    match (a){
        case Ok(v) => v-1
        case Err(_) => 1
    }
}
