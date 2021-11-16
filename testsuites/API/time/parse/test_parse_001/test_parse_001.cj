// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let times = [("0000-01-01T00:00:00Z", "0000-01-01T00:00:00Z"),
                    ("1800-12-31T23:59:59Z", "1800-12-31T23:59:59Z"),
                    ("2000-02-29T01:02:03Z", "2000-02-29T01:02:03Z"),
                    ("2008-12-19T16:39:57-08:00", "2008-12-19T16:39:57-08:00"),
                    ("2010-08-08T00:00:00+12:00", "2010-08-08T00:00:00+12:00"),
                    ("2012-05-31T08:30:00+16:00", "2012-05-31T08:30:00+16:00"),
                    ("2060-02-29T00:00:01+00:00:00", "2060-02-29T00:00:01Z"),
                    ("2002-10-02T15:00:00-00:00:00", "2002-10-02T15:00:00Z"),
                    ("2020-05-31T08:30:00+16:00:00", "2020-05-31T08:30:00+16:00"),
                    ("2048-02-29T23:59:59-08:30:30", "2048-02-29T23:59:59-08:30:30"),
                    ("2060-02-29T00:00:01+12:30:30", "2060-02-29T00:00:01+12:30:30")]
       
        var index = 0
        for (dateTime in times) {
            let time0 = Time.parse(dateTime[0]).getOrThrow().toString()
            let time1 = dateTime[1]
            assertEqual(time0, time1, "Comparing the result of Time.parse(), the index is ${index}\n")
            index++
        }
        return 0
    }
}

func assertEqual(actual : String, expected : String, msg : String) : Bool {
    if (actual != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${actual}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
