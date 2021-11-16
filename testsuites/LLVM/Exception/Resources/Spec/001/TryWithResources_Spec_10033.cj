// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

class A<T>{}

extend A<T>{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (x : A<Int64> = A<Int64>())
    {
    } finally {}
    print("success!\n")
    return 0
}
