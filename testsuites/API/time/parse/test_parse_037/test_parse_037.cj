// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let times = [("00:00:00.000000000", "0"),
                    ("00:30:30.123456789", "123456789"),
                    ("12:59:59.987654321", "987654321")]

        var index = 0
        for (dateTime in times) {
            let time0 = Time.parse(dateTime[0],"hh:mm:ss.SSS").getOrThrow().nanosecond()
            let time1 = dateTime[1]
            assertEqual(time0.toString(), time1.toString(), "Comparing the result of Time.parse(), the index is ${index}\n")
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
