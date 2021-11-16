// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let mylocation = "America/Tegucigalpa"

        let mydata: Array<UInt8> = Array<UInt8> ([84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3, 0, 0, 0, 12, 128,
        0, 0, 0, 164, 76, 75, 68, 32, 154, 220, 224, 33, 92, 155, 80, 34, 122, 190, 224, 35, 60, 125, 80,
        68, 93, 140, 224, 68, 214, 200, 208, 0, 2, 1, 2, 1, 2, 1, 2, 255, 255, 174, 60, 0, 0, 255, 255,
        185, 176, 1, 4, 255, 255, 171, 160, 0, 8, 76, 77, 84, 0, 67, 68, 84, 0, 67, 83, 84, 0, 0, 0, 0,
        0, 0, 0, 84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0,
        3, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3, 0, 0, 0, 12, 248, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255,
        164, 76, 75, 68, 0, 0, 0, 0, 32, 154, 220, 224, 0, 0, 0, 0, 33, 92, 155, 80, 0, 0, 0, 0, 34, 122,
        190, 224, 0, 0, 0, 0, 35, 60, 125, 80, 0, 0, 0, 0, 68, 93, 140, 224, 0, 0, 0, 0, 68, 214, 200, 208,
        0, 2, 1, 2, 1, 2, 1, 2, 255, 255, 174, 60, 0, 0, 255, 255, 185, 176, 1, 4, 255, 255, 171, 160, 0,
        8, 76, 77, 84, 0, 67, 68, 84, 0, 67, 83, 84, 0, 0, 0, 0, 0, 0, 0, 10, 67, 83, 84, 54, 10])

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
