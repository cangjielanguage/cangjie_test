// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

enum A<T>{
    a
    func isClosed(){print("A!");true}
    func close(){}
}

func test(){A<Bool>.a}

func main() {
    try (x : A<Bool> = test())
    {
    } finally {}
    print("success!\n")
    return 0
}
