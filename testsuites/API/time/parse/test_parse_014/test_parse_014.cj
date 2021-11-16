// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let times = [("00-12-10T11:30:00", "2000-12-10T11:30:00Z"),
                    ("68-12-10T11:30:00", "2068-12-10T11:30:00Z"),
                    ("69-12-10T11:30:00", "1969-12-10T11:30:00Z"),
                    ("70-12-10T11:30:00", "1970-12-10T11:30:00Z"),
                    ("99-12-10T11:30:00", "1999-12-10T11:30:00Z")]
       
        var index = 0
        for (dateTime in times) {
            let time0 = Time.parse(dateTime[0],"yy-MM-ddThh:mm:ss").getOrThrow().toString()
            let time1 = dateTime[1]
            assertEqual(time0, time1, "Comparing the result of Time.parse(), the index is ${index}\n")
            index++
        }
        return 0
    }
}

func assertEqual(actual : String, expected : String, msg : String) : Bool {
    if (actual != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${actual}\n\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
