// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan 0

from std import time.*

//@Test
class TestParseFormat {
    // 测试Time静态函数parser生成的Time实例 以及相关的运算符重载
//    @TestCase
    func testTimeParse() {
        print("testTimeParse\n")
        let times = [("-0000-01-01T00:00:00Z", "0000-01-01T00:00:00Z"),
                    ("-00000-01-01T00:00:00Z", "-0000-01-01T00:00:00Z")]
        var index = 0;
        for (dateTime in times) {
            let time0 = Time.parse(dateTime[0]).getOrThrow().toString()
            assertEqule(time0, dateTime[1], "Compare result of Time.parse(), the index is ${index}:")
        }

//        let day2 = Time.parse("-0001-12-31T23:59:59Z").getOrThrow()
//        let day3 = Time.parse("0000-01-01T00:00:01Z").getOrThrow()

        return 0
    }
}

func assertEqule(actual : String, expected : String, msg : String) : Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
