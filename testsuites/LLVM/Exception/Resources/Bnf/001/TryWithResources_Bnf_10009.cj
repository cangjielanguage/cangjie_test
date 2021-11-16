// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected resource management after identifier



class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    try (a !: Resource = A()) // use !: not :
    {}
    print("success!\n")
    return 0
}
