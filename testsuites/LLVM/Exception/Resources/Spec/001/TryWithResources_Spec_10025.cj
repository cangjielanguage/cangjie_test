// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

class A<T>{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (x : A<Bool> = A<Bool>())
    {
    } finally {}
    print("success!\n")
    return 0
}
