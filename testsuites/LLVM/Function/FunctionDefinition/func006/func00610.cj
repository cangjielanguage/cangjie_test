// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    func test(): Int64 {
        func deep_test() : Int64 {
            return 0
        }
        return deep_test()
    }
    func test2():Int64 {
        return 1
    }
    return test()
}
