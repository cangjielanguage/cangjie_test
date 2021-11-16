//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    var a = [synchronized(1){}] // EXPECTED:regex error.*?expected Mutex object after synchronized
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
