// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C{
    var c : Int64 = 1
}

class A <: C{
    func test():Result<Int64>{
        Ok(super.c)??super.c
        return Ok(0)
    }
}

func main(): Int64 {
    return A().test() ?? 1
}
