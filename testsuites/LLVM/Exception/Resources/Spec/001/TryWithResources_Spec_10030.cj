// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

interface A{
    func isClosed(){print("A!");true}
    func close(){}
}

class B <: A{}


func main() {
    try (x : A = B())
    {
    } finally {}
    print("success!\n")
    return 0
}
