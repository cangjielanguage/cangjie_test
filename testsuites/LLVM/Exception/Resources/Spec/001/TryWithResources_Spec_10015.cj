// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan generics do not match the declaration of 'Class-A<Generics-T>'

class A<T>{}

extend A<Bool> <: Resource{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (a : A<Int64> = A<Int64>())
    {
    } finally {}
    print("success!\n")
    return 0
}
