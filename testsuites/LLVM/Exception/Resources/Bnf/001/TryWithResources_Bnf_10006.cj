// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan missing ')' in try expression

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

class B <: Resource {
    func isClosed(){false}
    func close(){print("B!")}
}

func main() {
    try (a = A() b = B()) // without ,
    {}
    print("success!\n")
    return 0
}
