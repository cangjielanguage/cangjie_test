// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

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
    } catch (_) {
        x?[0] = 1
    } finally {
        x?[0] = 1
    }
    print("success!\n")
    return 0
}
