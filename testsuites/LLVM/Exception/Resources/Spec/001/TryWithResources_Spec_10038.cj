// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan redefinition of declaration 'close'

class B{
    operator func ()(){print("A!")}
}

class C{
    operator func ()(){true}
}

class A <: Resource{
    func isClosed(){print("A!");true}
    func close(){}
    var close : B = B()
    var isClosed : C = C()
}



func main() {
    try (x : A = A())
    {
    } finally {}
    print("success!\n")
    return 0
}
