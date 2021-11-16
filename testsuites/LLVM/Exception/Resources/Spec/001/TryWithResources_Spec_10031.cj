// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan 'Int64' is keyword not identifier, you can use '`Int64`' instead
// ASSERT: scan undeclared type name '<invalid identifier>'
interface A{
    func isClosed():Bool
    func close():Unit
}

extend Int64 <: A{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (x : Int64 = 1)
    {
    } finally {}
    print("success!\n")
    return 0
}
