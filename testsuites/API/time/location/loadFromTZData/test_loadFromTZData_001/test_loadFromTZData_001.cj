// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let mylocation = "Africa/Kinshasa"

        let mydata: Array<UInt8> = Array<UInt8> ([84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 18, 128, 0, 0, 0,
        134, 171, 112, 209, 140, 80, 96, 0, 150, 170, 67, 209, 161, 81, 239, 120, 0, 1, 0, 2, 3, 0, 0, 3,
        47, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 7, 8, 0, 8, 0, 0, 14, 16, 0, 14, 76, 77, 84, 0, 71, 77, 84, 0, 43,
        48, 48, 51, 48, 0, 87, 65, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 18, 248,
        0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 134, 171, 112, 209, 255, 255, 255, 255, 140, 80, 96, 0, 255,
        255, 255, 255, 150, 170, 67, 209, 255, 255, 255, 255, 161, 81, 239, 120, 0, 1, 0, 2, 3, 0, 0, 3, 47, 0,
        0, 0, 0, 0, 0, 0, 4, 0, 0, 7, 8, 0, 8, 0, 0, 14, 16, 0, 14, 76, 77, 84, 0, 71, 77, 84, 0, 43, 48, 48,
        51, 48, 0, 87, 65, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 87, 65, 84, 45, 49, 10, 0])

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
