// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected resource management after identifier



class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    try (A) // only type
    {}
    print("success!\n")
    return 0
}
