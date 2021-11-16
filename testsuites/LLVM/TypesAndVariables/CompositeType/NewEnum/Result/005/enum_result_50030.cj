// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
    var b : Option<Result<Int64>> = Some(Ok(1))
}

class C{
    var d : Result<Int64> = Ok(1)
}


func test():Result<Int64>{
    var a : ?A = A()
    var c : ?C = C()
    a?.b??c?.d
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
