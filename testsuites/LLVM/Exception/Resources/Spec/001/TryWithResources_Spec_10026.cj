// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

interface A<T>{
    func isClosed(){print("A!");true}
    func close(){}
}

class B<T> <: A<T>{}

func main() {
    try (x : A<Bool> = B<Bool>())
    {
    } finally {}
    print("success!\n")
    return 0
}
