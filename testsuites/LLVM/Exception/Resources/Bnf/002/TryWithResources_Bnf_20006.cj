// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan try!
// ASSERT: scan close!
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!\n")}
}

class B{operator func ()(){A()}}
var x : ?B = B()

func main() {
    try (a = x?()??A())
    {
        print("try!\n")
    }
    print("success!\n")
    return 0
}
