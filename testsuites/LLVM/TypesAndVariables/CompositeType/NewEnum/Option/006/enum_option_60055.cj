// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C{
    var c : Int64 = 1
}

class A <: C{
    func test():Option<Int64>{
        var x : ?Int64 = super.c
        return Some(0)
    }
}

func main(): Int64 {
    return A().test() ?? 1
}
