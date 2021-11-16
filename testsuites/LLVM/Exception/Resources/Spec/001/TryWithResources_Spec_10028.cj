// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

record A{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (x : A = A())
    {
    } finally {}
    print("success!\n")
    return 0
}
