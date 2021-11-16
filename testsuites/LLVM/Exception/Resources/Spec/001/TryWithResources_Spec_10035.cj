// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

interface A<T>{}

extend A<T>{
    func isClosed(){print("A!");true}
    func close(){}
}

class B<T> <: A <T>{}

func main() {
    try (x : A<Int64> = B<Int64>())
    {
    } finally {}
    print("success!\n")
    return 0
}
