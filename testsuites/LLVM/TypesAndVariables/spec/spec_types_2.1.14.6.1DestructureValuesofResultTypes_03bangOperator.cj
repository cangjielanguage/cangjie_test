// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f1(): Result<String> {
    let t: Result<String> = Result<String>.Ok("123")
    let r: String = t! // r = "ok"
    return Result<String>.Ok(r)
}

func f2(): Result<String> {
    let err = Exception()
    let t: Result<String> = Result<String>.Err(err)
    let r: String = t!  // return Result<String>.Err(err)
    return Result<String>.Ok(r)
}
func main(){
    var x = f1()
    var y = f2()
    return 0
}

