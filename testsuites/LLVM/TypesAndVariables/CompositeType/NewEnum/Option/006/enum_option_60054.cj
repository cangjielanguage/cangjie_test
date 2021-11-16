// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
    func test():Option<Int64>{
        var x : ?A = this
        return Some(0)
    }
}

func main(): Int64 {
    return A().test() ?? 1
}
