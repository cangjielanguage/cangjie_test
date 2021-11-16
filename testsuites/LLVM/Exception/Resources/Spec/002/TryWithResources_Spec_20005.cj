// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan undeclared identifier 'a'

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}



func main() {
    try (a : A = A())
    {
    } finally {}
    a.close()
    print("success!\n")
    return res
}
