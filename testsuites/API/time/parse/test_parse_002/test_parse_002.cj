// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not Failure

from std import time.*

func hasException(lamb: () -> Result<Time>): Bool {
    match (lamb()) {
        case Ok(v) => return false
        case Err(e) => return true
    }
}

class TestParseFormat {
    func testTimeParse() {
        let old1 = "2020-10-1T"
        if (!hasException({ Time.parse(old1) })) {
            print("Failure")
        }

        return 0
    }
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
