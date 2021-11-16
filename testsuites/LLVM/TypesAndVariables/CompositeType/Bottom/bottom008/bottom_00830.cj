// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Int64 {
    // lambda
    /*
    var a = \{
        return 0
    }
    */
    var a = {  => return 0}
    return 1
}

func main(): Int64 {
    return test() - 1
}