// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not Failure

from std import time.*

//@Test
class TestTime {

    // 测试Time构造函数 Time(sec : Int64, nanoSec : Int64)
    // 通过API data, clock, location, zone, utc, in, toString对生成的Time实例结果进行了验证
//    @TestCase
    func testTimeConstructor1() {
        print("testTimeConstructor1\n")
        let time = Time(0, 0).utc()
        if (assertEqule("验证此构造函数从1970.1.1 UTC开始计算", time.date(), (1970, January, 1)) ||
            assertEqule("验证此构造函数从1970.1.1 UTC 0h 0m 0s开始计算", time.clock(), (0, 0, 0)) ||
            assertEqule("验证此构造函数从1970.1.1 UTC开始计算", time.toString(), "1970-01-01T00:00:00Z" )) {
            return 1
        }
        return 0

//        assertEqule("验证此构造函数从1970.1.1 UTC 0h 0m 0s开始计算", time.zone(), ("UTC", 0))
//        assertEqule("验证此构造函数从1970.1.1 UTC开始计算", time.location().toString(), "UTC")
//        assertEqule("验证此构造函数从1970.1.1 UTC开始计算", time.utc(), time)
//        assertEqule("验证此构造函数从1970.1.1 UTC开始计算", time.inZone(time.location()), time)
    }

    // 测试Time构造函数 Time(sec : Int64, nanoSec : Int64) 可在计算年月日时分秒的自动进退位后生成正确的Time实例
    // 通过API：year, month, day, hour, minute, second, nanosecond, unix, unixNano
//    @TestCase
    func testTimeConstructor2() {
        print("testTimeConstructor2\n")
        let time = Time(-31536000, 31536000000000000).utc()
        if (assertEqule("验证此构造函数从1970.1.1 UTC开始，综合秒和纳秒输入进行计算，年", 1970, time.year()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始，综合秒和纳秒输入进行计算， 月", January, time.month()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始，综合秒和纳秒输入进行计算，日", 1, time.day()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始计算 0h 0m 0s开始，综合秒和纳秒输入进行计算，时", 0, time.hour()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始计算 0h 0m 0s开始，综合秒和纳秒输入进行计算，分", 0, time.minute()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始计算 0h 0m 0s开始，综合秒和纳秒输入进行计算，秒", 0, time.second()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始计算 0h 0m 0s开始，综合秒和纳秒输入进行计算，纳秒", 0, time.nanosecond()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始计算 0h 0m 0s 0ns开始，综合秒和纳秒输入进行计算，unix", 0, time.unix()) ||
        assertEqule("验证此构造函数从1970.1.1 UTC开始计算 0h 0m 0s 0ns开始，综合秒和纳秒输入进行计算，unixNano", 0, time.unixNano())) {
            return 1
        }
        return 0
    }

    // 测试构造器对年、月、日的正确计算
//    @TestCase
    func testTimeConstructor3() {
        print("testTimeConstructor3\n")
        let legalDate = [((-1, December, 32), ((0, January, 1))),
                        ((0, January, 32), (0, February, 1)),
                        ((0, February, 30), (0, March, 1)),
                        ((0, March, 32), (0, April, 1)),
                        ((0, April, 31), (0, May, 1)),
                        ((0, May, 32), (0, June, 1)),
                        ((0, June, 31), (0, July, 1)),
                        ((0, July, 32), (0, August, 1)),
                        ((0, August, 32), (0, September, 1)),
                        ((0, September, 31), (0, October, 1)),
                        ((0, October, 32), (0, November, 1)),
                        ((0, November, 31), (0, December, 1)),
                        ((100, February, 60), (100, April, 1)),
                        ((-1, December, 32), ((0, January, 1))),
                        ((0, January, 31), (0, February, 0)),
                        ((0, February, 29), (0, March, 0)),
                        ((0, March, 31), (0, April, 0)),
                        ((0, April, 30), (0, May, 0)),
                        ((0, May, 31), (0, June, 0)),
                        ((0, June, 30), (0, July, 0)),
                        ((0, July, 31), (0, August, 0)),
                        ((0, August, 31), (0, September, 0)),
                        ((0, September, 30), (0, October, 0)),
                        ((0, October, 31), (0, November, 0)),
                        ((0, November, 30), (0, December, 0)),
                        ((100, February, 28), (100, April, -31))]

        for (date in legalDate) {
            let timeA = Time(date[0][0], date[0][1], date[0][2])
            let timeB = Time(date[1][0], date[1][1], date[1][2])
            if (assertEqule("验证构造函数入参 ${date[0][0]} ${date[0][1]} ${date[0][2]} 和入参 ${date[1][0]} ${date[1][1]} ${date[1][2]} 的结果应该一致", timeA, timeB)) {
                return 1
            }
        }
        return 0
    }

    // 测试构造器对于时分秒的正确计算
//    @TestCase
    func testTimeConstructor4() {
        print("testTimeConstructor4\n")
        let legalDate = [((0, 0, 0, 0), ((23, 59, 59, 1000000000))),
                        ((0, 0, 0, -1), ((23, 59, 59, 999999999)))]
        for (date in legalDate) {
            let timeA = Time(0, January, 1, hour : date[0][0], min: date[0][1], sec : date[0][2], nsec : date[0][3])
            let timeB = Time(0, January, 0, hour : date[1][0], min: date[1][1], sec : date[1][2], nsec : date[1][3])
            if (assertEqule("验证构造函数入参 ${date[0][0]} ${date[0][1]} ${date[0][2]} ${date[0][3]} 和入参 ${date[1][0]} ${date[1][1]} ${date[1][2]} ${date[1][3]}的结果应该一致", timeA, timeB)) {
                return 1
            }
        }
        return 0
    }

    // 测试isoWeek，weekday能否正确计算出正确的日子。
    // 覆盖闰年引起的日期变化，以及年末年初时week变化
//    @TestCase
    func testWeekDay() {
        print("testWeekDay\n")
        let monday = Time(1, January, 1, loc:Location.UTC)
        let tuesday = Time(2, January, 1, loc:Location.UTC)
        let wednesday = Time(3, January, 1, loc:Location.UTC)
        let thursday = Time(4, January, 1, loc:Location.UTC)
        let friday = Time(-1, January, 1, loc:Location.UTC)
        let saturday = Time(0, January, 1, loc:Location.UTC)
        let sunday = Time(2021, June, 27, loc:Location.UTC)
        if (assertEqule("测试weekday, 公元1年1月1日，是星期一", Monday, monday.weekday()) ||
            assertEqule("测试weekday, 公元2年1月1日，是星期二", Tuesday, tuesday.weekday()) ||
            assertEqule("测试weekday, 公元3年1月1日，是星期三", Wednesday, wednesday.weekday()) ||
            assertEqule("测试weekday, 公元4年1月1日，是星期四", Thursday, thursday.weekday()) ||
            assertEqule("测试weekday, 公元-1年1月1日，是星期五", Friday, friday.weekday()) ||
            assertEqule("测试weekday, 公元0年1月1日，是星期六", Saturday, saturday.weekday()) ||
            assertEqule("测试weekday, 公元2021年6月27日，是星期日", Sunday, sunday.weekday())) {
            return 1
        }
        return 0
    }

    // 测试isoWeek能否正确计算出正确的日子。
    // 覆盖闰年引起的日期变化，以及年末年初时week变化
//    @TestCase
    func testIsoWeek() {
        print("testIsoWeek")
        let week1 = Time(1, January, 1, loc:Location.UTC)
        let week2 = Time(0, January, 2, loc:Location.UTC)
        let week3 = Time(0, December, 24, loc:Location.UTC)
        let week4 = Time(2, January, 0, loc:Location.UTC)
        if (assertEqule("测试isoweek, 公元1年1月1日，第1周", (1,1), week1.isoWeek()) ||
            assertEqule("测试isoweek, 公元0年1月2日，是第52周", (-1, 52), week2.isoWeek()) ||
            assertEqule("测试isoweek, 公元0年12月24日，是第52周", (0, 51), week3.isoWeek()) ||
            assertEqule("测试isoweek, 公元1年12月31日，是第53周", (2, 1), week4.isoWeek())) {
            return 1
        }
        return 0
    }

    // 测试yearDay能否正确计算出正确的日子。
    // 覆盖闰年引起的日期变化，以及年末年初时week变化
//    @TestCase
    func testYearDay() {
        print("testYearDay\n")
        let day1 = Time(0, January, 1, loc:Location.UTC)
        let day2 = Time(0, December, 31, loc:Location.UTC)
        let day3 = Time(100, December, 31, loc:Location.UTC)
        let day4 = Time(400, December, 31, loc:Location.UTC)
        if (assertEqule("测试yearDay, 公元0年1月1日: ", 1, day1.yearDay()) ||
            assertEqule("测试yearDay, 公元0年12月31日: ", 366, day2.yearDay()) ||
            assertEqule("测试yearDay, 公元100年12月31日: ", 365, day3.yearDay()) ||
            assertEqule("测试yearDay, 公元400年12月31日: ", 366, day4.yearDay())) {
            return 1
        }
        return 0
    }

    // 覆盖超过unixNano函数的取值范围后能够正确抛出异常
//    @TestCase
    func testUnixNano() {
        print("testUnixNano\n")
        let timeExceed = [(Time(0 , -0x7FFF_FFFF_FFFF_FFFF) + Duration.nanosecond(-1), Duration.nanosecond(-1)),
                        (Time(0, 0x7FFF_FFFF_FFFF_FFFE) + Duration.nanosecond(), Duration.nanosecond(1))]
        for (time in timeExceed) {
            var timeLimitation = time[0] + time[1]
            try {
                let nanoSecond = timeLimitation.unixNano()
            }
            catch (_) {
                continue
            }
            print("Exceed the unixNano")
            return 1
        }
        return 0
    }
//    @TestCase
    func testUnix() {
        print("testUnix\n")
        var minTime = Time(0, 0)
        var maxTime = Time(0, 0)
        for (i in 0..1000000000) {
            minTime = minTime + Duration.nanosecond(-0x8000_0000_0000_0000)
            maxTime = maxTime + Duration.nanosecond(0x7FFF_FFFF_FFFF_FFFF)
        }
        print("minTime: " + minTime.toString() + "\n")
        print("maxTime: " + maxTime.toString() + "\n")
        let timeExceed = [(minTime, Duration.second(-1)),
                        (maxTime, Duration.second(1))]
        for (time in timeExceed) {
            var timeLimitation = time[0] + time[1]
            try {
                let second = timeLimitation.unix()
                print(second.toString())
            }
            catch (_) {
                continue
            }
            print("Exceed the unix!")
            return 1
        }
        return 0
    }

    // 测试Time实例加法运算, 覆盖年、月、日的计算自动进位、退位等
    // 部分校验可通过重载的+ -运算符 对结果进行内部校验和计算
//    @TestCase
    func testAddDays() {
        print("testAddDays\n")
        let day = Time(0, January, 1)
        if (assertEqule("测试addDays 1: ", day + Duration.hour(8784), day.addDays(1, 0, 0)) ||
        assertEqule("测试addDays 2: ", day + Duration.hour(8784), day.addDays(-1, 14, 306)) ||
        assertEqule("测试addDays 3: ", day + Duration.hour(8784), day.addDays(3, -12, -365))) {
            return 1
        }
        return 0
    }

    // 测试静态函数now parse since until
    // 部分校验可通过重载的+ -运算符 对结果进行内部校验和计算
//    @TestCase
    func testSinceAndUntil() {
        print("testSinceAndUntil\n")
        let history = Time.now() + Duration.hour(-1)
        let duration1 = Time.since(history)

        let futurn = Time.now() + Duration.hour(1)
        let duration2 = Time.until(futurn)
        if ((duration1 - duration2).milliseconds() != 0) {
            print("Test since and until, the duration is ${(duration1 - duration2).milliseconds()}!\n")
            return 1
        }
        return 0
    }
}

func assertEqule(msg : String, expected : Int64, actual : Int64) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Time, actual : Time) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : String, actual : String) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Month, actual : Month) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Weekday, actual : Weekday) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Int64*Month*Int64, actual : Int64*Month*Int64) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is different from actual \n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Int64*Int64*Int64, actual : Int64*Int64*Int64) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected[0]}:${expected[1]}:${expected[2]}, but the actual is ${actual[0]}:${actual[1]}:${actual[2]}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Int64*Int64, actual : Int64*Int64) : Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected[0]} ${expected[1]} , but the actual is ${actual[0]} ${actual[1]}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestTime = TestTime()

    // if (( cases.testUnixNano() == 1) || (cases.testTimeConstructor1() ==1) || (cases.testTimeConstructor2()==1) ||
    // (cases.testTimeConstructor3() ==1) || (cases.testTimeConstructor4() == 1) || (cases.testWeekDay() == 1)
    // || (cases.testIsoWeek() == 1)|| (cases.testAddDays()==1) || (cases.testSinceAndUntil() ==1)) {
    //     print("Failure\n")
    //     return 1
    // }

    return cases.testUnixNano() |
           //cases.testUnix() |
           cases.testTimeConstructor1() |
           cases.testTimeConstructor2() |
           cases.testTimeConstructor3() |
           cases.testTimeConstructor4() |
           cases.testWeekDay() |
           cases.testIsoWeek() |
           cases.testAddDays() |
           cases.testSinceAndUntil()
}
