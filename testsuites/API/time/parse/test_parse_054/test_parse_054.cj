// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o libtest_parse_050.so
// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link -lcangjie-ffic  -L. -ltest_parse_050" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32
foreign func getDate(y: CString, symA: CString, M: CString, symB: CString, d: CString, symC: CString, h: CString, symD: CString, m: CString, symE:CString, s:CString): CString
foreign func getSymbolA():CString
foreign func getSymbolB():CString

class TestParseFormat {
    unsafe func testTimeParse() {
        var symbolA: CString = getSymbolA()
        var symbolB: CString = getSymbolB()

        var myDate1: CString = getDate(CString("000123"), symbolA, CString("08"), symbolB, CString("8"), CString("T"), CString("1"), CString(":"), CString("3"), CString(":"), CString("3"))
        var myDateFormat1: CString = getDate(CString("yyyyyy"), symbolA, CString("MM"), symbolB, CString("d"), CString("T"), CString("h"), CString(":"), CString("m"), CString(":"), CString("s"))
        let newDate1 = Time.parse(myDate1.toString(), myDateFormat1.toString()).getOrThrow().toString()
       
        assertEqual(newDate1, "0123-08-08T01:03:03Z", "Comparing the result of Time.parse()\n")

        var myDate2: CString = getDate(CString("000000"), symbolA, CString("03"), symbolB, CString("1"), CString("T"), CString("0"), CString(":"), CString("1"), CString(":"), CString("2"))
        var myDateFormat2: CString = getDate(CString("yyyyyy"), symbolA, CString("MM"), symbolB, CString("d"), CString("T"), CString("h"), CString(":"), CString("m"), CString(":"), CString("s"))
        let newDate2 = Time.parse(myDate2.toString(), myDateFormat2.toString()).getOrThrow().toString()

        assertEqual(newDate2, "0000-03-01T00:01:02Z", "Comparing the result of Time.parse()\n")

        var myDate3: CString = getDate(CString("001234"), symbolA, CString("11"), symbolB, CString("1"), CString("T"), CString("12"), CString(":"), CString("1"), CString(":"), CString("1"))
        var myDateFormat3: CString = getDate(CString("yyyyyy"), symbolA, CString("MM"), symbolB, CString("d"), CString("T"), CString("hh"), CString(":"), CString("m"), CString(":"), CString("s"))
        let newDate3 = Time.parse(myDate3.toString(), myDateFormat3.toString()).getOrThrow().toString()

        assertEqual(newDate3, "1234-11-01T12:01:01Z", "Comparing the result of Time.parse()\n")

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
