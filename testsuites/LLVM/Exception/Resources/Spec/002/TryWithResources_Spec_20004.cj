// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan cannot assign to value which is an initialized 'let' constant

class A <: Resource {
    func isClosed(){false}
    func close(){print(res)}
    var res : String = ""
    init(x:String){res = x}
}



func main() {
    try (a : A = A("A!"))
    {
        a = A("B!")  // a let or var?
    } finally {}
    print("success!\n")
    return 0
}
