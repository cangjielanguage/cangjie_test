// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan cannot assign to value which is an initialized 'let' constant



class A <: Resource {
    var flag:Bool = false
    init(x:Bool){
        flag = x
    }
    func isClosed(){if (flag){print("isClosed!")};return flag}
    func close(){if (flag){print("close!")}}
}

func main() {
    try (a = A(true))
    {a = A(false)} // legal?
    print("success!\n")
    return 0
}
