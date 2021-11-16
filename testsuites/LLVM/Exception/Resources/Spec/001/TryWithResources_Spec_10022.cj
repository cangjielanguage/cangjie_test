// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan primitive type 'Int64' cannot extend import interface

extend Int64 <: Resource{
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
