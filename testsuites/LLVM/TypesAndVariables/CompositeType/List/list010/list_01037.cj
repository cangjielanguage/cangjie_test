// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
    func test(): Int64 {
        var a = [this]
        return a.size() - 1
    }
}

func main(): Int64 {
    return A().test()
}
