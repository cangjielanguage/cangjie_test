// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

from std import sync.*

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

var m = Mutex()

func main() {
    try (a = A())
    {
        synchronized(m){A()}
    } catch (_) {
        synchronized(m){A()}
    } finally {
        synchronized(m){A()}
    }
    print("success!\n")
    return 0
}
