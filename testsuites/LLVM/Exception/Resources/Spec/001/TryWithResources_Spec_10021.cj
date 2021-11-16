// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan generics do not match the declaration of 'Enum-A<Generics-T>'

enum A<T>{
    a
}

extend A<Int64> <: Resource{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (x : A<Bool> = A<Bool>.a)
    {
    } finally {}
    print("success!\n")
    return 0
}
