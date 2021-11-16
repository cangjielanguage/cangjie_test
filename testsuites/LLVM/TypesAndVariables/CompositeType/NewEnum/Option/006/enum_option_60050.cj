// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test():Option<Int64>{
    var x : ?Unit = return // EXPECTED: regex-auto initialization expression of Nothing type is not supported currently
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
