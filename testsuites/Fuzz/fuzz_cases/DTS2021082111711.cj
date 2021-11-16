// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}


class B{
    operator func [](x:Int64,y:Int64){}
}

var x : ?B = B()

func main() {
    try (a = A())
    {
        x?[0] = 1
    } catch success!\n")
    return  1
    }
    print("(_) {
        x?[0] = 1
    } finally {
        x?[0] =0
}