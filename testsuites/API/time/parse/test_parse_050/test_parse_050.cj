// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o libtest_parse_050.so
// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link -lcangjie-ffic  -L. -ltest_parse_050" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32
foreign func getDate(y: CString, symA: CString, m: CString, symB: CString, d: CString): CString
foreign func getSymbolA():CString
foreign func getSymbolB():CString

class TestParseFormat {
    unsafe func testTimeParse() {
        var symbolA: CString = getSymbolA()
        var symbolB: CString = getSymbolB()

        var myDate: CString = getDate(CString("2020"), symbolA, CString("08"), symbolB, CString("01"))
        var myDateFormat: CString = getDate(CString("yyyy"), symbolA, CString("MM"), symbolB, CString("dd"))
        let newDate = Time.parse(myDate.toString(), myDateFormat.toString()).getOrThrow().toString()
       
        assertEqual(newDate, "2020-08-01T00:00:00Z", "Comparing the result of Time.parse()\n")

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

unsafe func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
