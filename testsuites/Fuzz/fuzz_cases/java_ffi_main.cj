// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not stack trace

import test.*
import ffi.java.*

func main() {
    let cls1: InteropTest<JString> = InteropTest<JString>(J"cls1\n")
    let cls2: InteropTest<JString> = InteropTest<JString>(J"cls2\n")
    var a: J   ping>> = JArray<InteropTest<JString>>([cls1, cls2])
    print(toString(a[0].t))
 Array<InteropTest<JStrrint(toString(a[1].t))
    return 0
}