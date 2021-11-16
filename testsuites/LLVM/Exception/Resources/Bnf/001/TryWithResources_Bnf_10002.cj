// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected identifier here

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

func main() {
    try () // no a here.
    {
        print("try!\n")
    } finally {}
    print("success!\n")
    return 0
}
