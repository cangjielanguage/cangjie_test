// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

enum A<T>{
    a
}

extend A<T>{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (x : A<Int64> = A<Int64>.a)
    {
    } finally {}
    print("success!\n")
    return 0
}
