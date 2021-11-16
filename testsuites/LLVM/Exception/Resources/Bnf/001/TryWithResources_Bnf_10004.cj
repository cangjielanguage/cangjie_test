// ERRCHECK: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan redefinition of resource declaration 'a'
class A <: Resource {
    func isClosed(){false}
    func close(){print("A!")}
    func test(){print("I am A.\n")}
}

class B <: Resource {
    func isClosed(){false}
    func close(){print("B!")}
    func test(){print("I am B.\n")}
}

func main() {
    try (a = A(),a = B()) // EXPECTED:regex redefinition of resource declaration 'a'
    {a.test()}
    print("success!\n")
    return 0
}
