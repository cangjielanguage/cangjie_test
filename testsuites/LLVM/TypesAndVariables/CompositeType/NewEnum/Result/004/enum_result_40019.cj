// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var a = Ok(1)
    func test():Result<Int64>{
        this.a!
        return Ok(0)
    }
}

func main(): Int64 {
    return A().test() ?? 1
}
