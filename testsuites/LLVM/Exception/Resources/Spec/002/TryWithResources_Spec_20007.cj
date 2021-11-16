// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan undeclared identifier 'a'

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}



func main() {
    try (a : A = A())
    {
    } catch (_){a.close()}
    finally {}
    print("success!\n")
    return res
}
