// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        var mytime = Time.now(Location.UTC)
        var myzone = mytime.zone()
        var myzonename = myzone[0]
        var myzoneoffset = myzone[1].toString()

        assertEqual(myzonename, "UTC" , "Comparing the result of Location.UTC, name\n")
        assertEqual(myzoneoffset, "0" , "Comparing the result of Location.UTC, offset\n")
        return 0
    }
}

func assertEqual(result : String, expected : String, msg : String) : Bool {
    if (result != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${result}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
