// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let times = [("2019-01-14-M", "2019-01-14T00:00:00Z"),
                    ("2020-02-29-S", "2020-02-29T00:00:00Z"),
                    ("2021-12-31-F", "2021-12-31T00:00:00Z")]

        var index = 0
        for (dateTime in times) {
            let time0 = Time.parse(dateTime[0],"yyyy-MM-dd-wwwww").getOrThrow().toString()
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
