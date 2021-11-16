// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not 1

from std import time.*
from std import collection.*

let minNanoSecond = -9_223_372_036_854_775_808
let minMicrosecond = -9_223_372_036_854_775_808 / 1000
let minMillisecond = -9_223_372_036_854_775_808 / 1000_000
let minSecond = -9_223_372_036_854_775_808 / 1000_000_000
let minMinute = -9_223_372_036_854_775_808 / 60_000_000_000
let minHour = -9_223_372_036_854_775_808 / 3_600_000_000_000

let maxNanoSecond = 0x7FFF_FFFF_FFFF_FFFF
let maxMicrosecond = 0x7FFF_FFFF_FFFF_FFFF / 1000
let maxMillisecond = 0x7FFF_FFFF_FFFF_FFFF / 1000_000
let maxSecond = 0x7FFF_FFFF_FFFF_FFFF / 1000_000_000
let maxMinute = 0x7FFF_FFFF_FFFF_FFFF / 60_000_000_000
let maxHour = 0x7FFF_FFFF_FFFF_FFFF / 3_600_000_000_000

//@Test
class TestDuration {

    // 验证无参的初始化函数生成的duration默认为1
    // @TestCase
    func testDuration0() : Int64 {

        let constructors0 : HashMap<String, ()->Duration> = HashMap<String, ()->Duration>([
            ("nanosecond: ", Duration.nanosecond),
            ("microsecond: ", Duration.microsecond),
            ("millisecond: ", Duration.millisecond),
            ("second: ", Duration.second),
            ("minute: ", Duration.minute),
            ("hour: ", Duration.hour)
        ])

        let constructors1 : HashMap<String, ((Int64)->Duration)*List<Int64>> = HashMap<String, ((Int64)->Duration)*List<Int64>> ([
            ("nanosecond: ", (Duration.nanosecond, [-1, 0])),
            ("microsecond: ", (Duration.microsecond, [-1, 0])),
            ("millisecond: ", (Duration.millisecond, [-1, 0])),
            ("second: ", (Duration.second, [-1, 0])),
            ("minute: ", (Duration.minute, [-1, 0])),
            ("hour: ", (Duration.hour, [-1, 0]))
        ])

        for ((constructorName, constructor) in constructors1) {
            let duration0 = constructor[0](constructor[1][0])
            let duration1 = constructor[0](constructor[1][1])
            let duration2 = constructors0[constructorName]()
            if (assertEqule("Instance created by ${constructorName}: ", duration1, duration0 + duration2)) {
                return 1
            }
        }
        return 0
    }

    // 验证超过范围的duration生成会抛出异常
    // @TestCase
    func testDuration1() : Int64 {

        let cases : HashMap<String, ((Int64)->Duration)*List<Int64>> = HashMap<String, ((Int64)->Duration)*List<Int64>> ([
            ("nanosecond: ", (Duration.nanosecond, [minNanoSecond, maxNanoSecond])),
            ("microsecond: ", (Duration.microsecond, [minMicrosecond, maxMicrosecond])),
            ("millisecond: ", (Duration.millisecond, [minMillisecond, maxMillisecond])),
            ("second: ", (Duration.second, [minSecond, maxSecond])),
            ("minute: ", (Duration.minute, [minMinute, maxMinute])),
            ("hour: ", (Duration.hour, [minHour, maxHour]))
        ])

        var result = 0
        for ((constructorName, constructor) in cases) {
            var minDuration = constructor[0](constructor[1][0])
            var maxDuration = constructor[0](constructor[1][1])

            if (testException("Test out of min range:", { constructor[0](constructor[1][0] - 1)})) {
                result = 1
            }
            if (testException("Test out of max range:", { constructor[0](constructor[1][1] + 1)})) {
                result = 1
            }
        }
        return result
    }

    // 验证成员函数的功能正确性
    // @TestCase
    func testDuration2() : Int64 {

        let durationNanoSecond = Duration.nanosecond(-3600000000000)
        let durationMicroSecond = Duration.microsecond(3600000000)
        let durationMilliSecond = Duration.millisecond(-3600000)
        let durationSecond = Duration.second(3600)
        let durationMinute = Duration.minute(-60)
        let durationHour = Duration.hour(1)

        if (assertEqule("Test nanoseconds", durationMilliSecond.nanoseconds(), durationMinute.nanoseconds()) ||
            assertEqule("Test microseconds", durationSecond.microseconds(), durationHour.microseconds()) ||
            assertEqule("Test milliseconds", durationNanoSecond.milliseconds(), durationMinute.milliseconds()) ||
            assertEqule("Test seconds", durationHour.seconds(), durationMicroSecond.seconds()) ||
            assertEqule("Test minutes", durationMilliSecond.minutes(), durationNanoSecond.minutes()) ||
            assertEqule("Test hours", durationMicroSecond.hours(), durationSecond.hours())) {
            return 1
        }
        return 0
    }

    // 验证运算符重载在运算溢出时能正常抛异常
    // @TestCase
    func testDuration3() : Int64 {
        let durationNanoSecond = Duration.nanosecond(0)
        let durationMicroSecond = Duration.microsecond(minMicrosecond)
        let durationMilliSecond = Duration.millisecond(maxMillisecond)
        let durationSecond = Duration.second(1)
        let durationMinute = Duration.minute(-1)
        let durationHour = Duration.hour()

        var result = 0
        if (testException("Test operator -", { durationMicroSecond - durationSecond })) {
            result = 1
        }
        if (testException("Test operator -", { durationMilliSecond - durationMinute })) {
            result = 1
        }
        if (testException("Test operator +", { durationMicroSecond + durationMinute })) {
            result = 1
        }
        if (testException("Test operator +", { durationMilliSecond + durationSecond })) {
            result = 1
        }
        if (testException("Test operator *", { durationMicroSecond * (-2) })) {
            result = 1
        }
        if (testException("Test operator *", { durationMilliSecond * 2 })) {
            result = 1
        }
        if (testException("Test operator /", {durationMinute / durationNanoSecond})) {
            result = 1
        }
        if (testException("Test operator /", {durationSecond / durationNanoSecond})) {
            result = 1
        }
        if (testException("Test operator /", {durationHour / durationNanoSecond})) {
            result = 1
        }

        return result
    }

    // 验证运算符重载计算正确性
    // @TestCase
    func testDuration4() : Int64 {
        let durationNanoSecond = Duration.nanosecond(0)
        let durationMicroSecond = Duration.microsecond(minMicrosecond)
        let durationMilliSecond = Duration.millisecond(maxMillisecond)
        let durationSecond = Duration.second(1)
        let durationMinute = Duration.minute(-1)
        let durationHour = Duration.hour()

        var result = 0
        if (assertEqule("Test operator + between second and minute:", Duration.second(-59), durationSecond + durationMinute)) {
            result = 1
        }
        if (assertEqule("Test operator - between hour and minute:", Duration.minute(61), durationHour - durationMinute)) {
            result = 1
        }
        if (assertEqule("Test operator * between second and hour:", durationHour, durationSecond * 3600)) {
            result = 1
        }
        if (assertEqule("Test operator / between hour and minute:", -60, durationHour / durationMinute)) {
            result = 1
        }
        if (assertEqule("Test operator / between second and hour:", 0, durationMinute / durationHour)) {
            result = 1
        }
        if (durationMicroSecond >= durationNanoSecond) {
            print("Test operator >= between MicroSecond and NanoSecond:")
            result = 1
        }
        if (durationMilliSecond <= durationNanoSecond) {
            print("Test operator <= between MilliSecond and NanoSecond:")
            result = 1
        }
        if (durationSecond > durationHour) {
            print("Test operator > between second and hour:")
            result = 1
        }
        if (durationSecond < durationMinute) {
            print("Test operator < between second and minute:")
            result = 1
        }

        return result
    }

    // 验证toString方法的功能正确性
    // @TestCase
    func testDuration5() : Int64 {
        let durationZero = Duration.hour(0)
        let durationHour = Duration.hour()
        let durationMinute = Duration.minute()
        let durationSecond = Duration.second()
        let durationNanoSecond = Duration.nanosecond()
        let durationMicroSecond = Duration.microsecond()
        let durationMilliSecond = Duration.millisecond()

        var result = 0
        if (assertEqule("Test toString: ", "58m58s998ms998us998ns",
            (durationHour - durationMinute - durationSecond - durationNanoSecond -
                durationMilliSecond - durationMicroSecond - durationNanoSecond).toString())) {
            result = 1
        }
        if (assertEqule("Test toString: ", "-58m58s998ms998us998ns",
            (durationHour * (-1) + durationMinute + durationSecond + durationNanoSecond +
                durationMilliSecond + durationMicroSecond + durationNanoSecond).toString())) {
            result = 1
        }
        return result
    }
}

func testException(msg : String, lambdaExpr : ()->Int64) : Bool {
    try {
        lambdaExpr()
    } catch (_) {
        return false
    }
    print(msg + "\n")
    return true
}

func testException(msg : String, lambdaExpr : ()->Duration) : Bool {
    try {
        lambdaExpr()
    } catch (_) {
        return false
    }
    print(msg + "\n")
    return true
}

func assertEqule(msg : String, expected : Int64, actual : Int64) : Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : String, actual : String) : Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg : String, expected : Duration, actual : Duration) : Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestDuration = TestDuration()
    return cases.testDuration3()
        cases.testDuration0() |
        cases.testDuration1() |
        cases.testDuration2() |
        cases.testDuration3() |
        cases.testDuration4() |
        cases.testDuration5()
}
