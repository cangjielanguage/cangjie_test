// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Exception
// ASSERT: scan day out of range

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let old1 = "2010-04-31T12:20:30Z"
        let new1 = Time.parse(old1).getOrThrow().toString()
        return 0
    }
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
