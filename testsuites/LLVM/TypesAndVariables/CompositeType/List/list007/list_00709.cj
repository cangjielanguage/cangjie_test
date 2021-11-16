//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped

class C{
    func test():This{this}
    var b : C
    var c = [test(),b] // EXPECTED: regex error.*? is not allowed to be accessed before all member variables are initialized
}


func main(): Int64 {
    return 0
}
