// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
    func test():Result<Int64>{
        Ok(this)??this
        return Ok(0)
    }
}

func main(): Int64 {
    return A().test() ?? 1
}
