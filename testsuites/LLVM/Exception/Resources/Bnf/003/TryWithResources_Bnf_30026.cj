// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

from std import sync.*

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        (spawn{A()}).getResult()??A()
    } catch (_) {
        (spawn{A()}).getResult()??A()
    } finally {
        (spawn{A()}).getResult()??A()
    }
    print("success!\n")
    return 0
}
