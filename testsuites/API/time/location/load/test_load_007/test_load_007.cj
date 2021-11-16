// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let mylocations = [("Africa/Douala","2021-08-06T09:00:00+01:00"), ("America/Chicago", "2021-08-06T03:00:00-05:00"),
        ("Asia/Shanghai", "2021-08-06T16:00:00+08:00"), ("Europe/London", "2021-08-06T09:00:00+01:00")]
        var mytime = Time(2021, Month.August, 06, hour:08, min:00, sec:00, nsec:0, loc: Location.UTC)

        for (location in mylocations) {
            var mylocation = Location.load(location[0])
            var mylocationname = mylocation.getOrThrow().toString()
            assertEqual(mylocationname, location[0], "Comparing the result of load()\n")

            var newtime = mytime.inZone(mylocation.getOrThrow())
            assertEqual(newtime.toString(), location[1], "Comparing the result of load()\n")
        }
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