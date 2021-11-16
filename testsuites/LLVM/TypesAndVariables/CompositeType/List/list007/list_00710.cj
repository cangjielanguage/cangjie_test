//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped

interface I{
    static func test():This {this} // EXPECTED:regex error.*?type is not allowed here
    let b : I = C()
    let c = [test(),b]
}

class C <: I{}


func main(): Int64 {
    return 0
}
