// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification is not allowed nested try_with_resource expression

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = try(b = A()){A()})
    {
        print("try!\n")
    }
    print("success!\n")
    return 0
}
