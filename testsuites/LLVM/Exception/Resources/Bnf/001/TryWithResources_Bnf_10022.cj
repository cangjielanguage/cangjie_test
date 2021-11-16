// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan isClosed!success!


class A <: Resource {
    var flag:Bool = false
    init(x:Bool){
        flag = x
    }
    func isClosed(){if (flag){print("isClosed!")};return flag}
    func close(){if (flag){print("close!")}}
    func foo(){this.flag = true}
}

func main() {
    try (a = A(false))
    {a.foo()}
    print("success!\n")
    return 0
}
