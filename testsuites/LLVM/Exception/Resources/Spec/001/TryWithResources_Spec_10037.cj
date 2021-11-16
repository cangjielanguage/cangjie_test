// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the ResourceSpecification in try_with_resource must extend 'Resource' interface

class B{
    operator func ()(){print("A!")}
}

class C{
    operator func ()(){true}
}

class A{
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
