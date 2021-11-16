// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var A : List<Option<Result<Int64>>> = [Some(Ok(1))]
var b = 0
var C : List<Result<Int64>> = [Ok(1)]
var d = 0

func test():Result<Int64>{
    var a : ?List<Option<Result<Int64>>> = A
    var c : ?List<Result<Int64>> = C
    a?[b] ?? c?[d]
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
