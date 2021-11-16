// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected identifier here



class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    try ((a,b) = (A(),A())) // Tuple pattern
    {}
    print("success!\n")
    return 0
}
