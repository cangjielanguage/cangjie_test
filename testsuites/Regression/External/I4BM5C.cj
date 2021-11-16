// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    var c = Ok(100)
    let res = Result<Bool>.Err(Exception("message: String"))
    let res2 = Result<Bool>.Err(Exception("message: String"))
    return 0
}
