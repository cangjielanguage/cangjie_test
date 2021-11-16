// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let mylocation = "Pacific/Niue"

        let mydata: Array<UInt8> = Array<UInt8> ([84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 20,
        128, 0, 0, 0, 220, 67, 53, 96, 16, 116, 202, 56, 127, 255, 255, 255, 1, 2, 3, 3, 255, 255, 96,
        180, 0, 0, 255, 255, 96, 160, 0, 4, 255, 255, 94, 72, 0, 10, 255, 255, 101, 80, 0, 16, 76, 77,
        84, 0, 45, 49, 49, 50, 48, 0, 45, 49, 49, 51, 48, 0, 45, 49, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84,
        90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 20, 248, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 126, 55,
        84, 76, 255, 255, 255, 255, 220, 67, 53, 96, 0, 0, 0, 0, 16, 116, 202, 56, 0, 0, 0, 0, 127, 255,
        255, 255, 0, 1, 2, 3, 3, 255, 255, 96, 180, 0, 0, 255, 255, 96, 160, 0, 4, 255, 255, 94, 72, 0,
        10, 255, 255, 101, 80, 0, 16, 76, 77, 84, 0, 45, 49, 49, 50, 48, 0, 45, 49, 49, 51, 48, 0, 45,
        49, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 60, 45, 49, 49, 62, 49, 49, 10])

        var newlocation = Location.loadFromTZData(mylocation, mydata)
        var newlocationname = newlocation.getOrThrow().toString()

        assertEqual(newlocationname, mylocation, "Comparing the result of loadFromTZData()\n")
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
