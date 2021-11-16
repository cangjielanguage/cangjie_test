// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan This is the first output!
// ASSERT: scan 2

from std import time.*

class TestTimer {
    func test() {
        let durationTimer = Timer(Duration.millisecond(2000), { print("1\n") })
        let timeTimer = Timer(Time.now() + Duration.millisecond(2000), { print("2\n") })
        var result = 0
        // 未启动时停止
        if (durationTimer.stop() || timeTimer.stop()) {
            result = 1
        }
        sleep(200000000)
        // 检查是否stop成功
        print("This is the first output!\n")

        // 未触发定时，重设
        if (durationTimer.reset(Duration.millisecond(200)) || timeTimer.reset(Time.now() + Duration.millisecond(200))) {
            result = 1
        }
        sleep(200000000)

        // 已触发任务, 此时重设返回true
        if (!durationTimer.reset(Duration.millisecond(200), { print("3\n") }) &&
            !timeTimer.reset(Time.now() + Duration.millisecond(200), { print("4\n") })) {
            result = 1
        }
        sleep(200000000)

        // 已触发任务
        if (!durationTimer.stop() && !timeTimer.stop()) {
            result = 1
        }

        // 由于已经stop了，所以此时reset返回为false
        if (durationTimer.reset(Duration.millisecond(200), { print("5\n") }) ||
            timeTimer.reset(Time.now() + Duration.millisecond(200), { print("6\n") })) {
            result = 1
        }
        sleep(200000000)

        return result
    }

    func testException() {
        var result = 0
        let durationTimer = Timer(Duration.second(3), { print("1") })
        let timeTimer = Timer(Time.now() + Duration.second(3), { print("2") })

        let illegalTime = [Time.now(), Time.now() + Duration.second(-5)]
        let illegalDuratioin = [Duration.nanosecond(-1), Duration.second(-1)]

        for (illegal in illegalTime) {
            try {
                let timer = Timer(illegal, { print("this is an illegal timer, duration is ${illegal} }!\n") })
            } catch (_) {
                try {
                    let boolresult = durationTimer.reset(illegal)
                } catch (_) {
                    try {
                        let boolresult = timeTimer.reset(illegal, { print("3") })
                    } catch (_) {
                        continue
                    }
                    print("1 this is an illegal duration for timeTimer.reset!\n")
                    result = 1
                }
                print("2 this is an illegal duration for durationTimer.reset!\n")
                result = 1
            }
            print("3 this is an illegal timer, time is ${illegal} }!\n")
            result = 1
        }

        for (illegal in illegalDuratioin) {
            try {
                let timer = Timer(illegal, { print("this is an timer}!\n") })
            } catch (_) {
                try {
                    let boolresult = timeTimer.reset(illegal)
                } catch (_) {
                    try {
                        let boolresult = durationTimer.reset(illegal, { print("3") })
                    } catch (_) {
                        continue
                    }
                    print("1 this is an illegal time for durationTimer.reset!\n")
                    result = 1
                }
                print("2 this is an illegal time for timeTimer.reset!\n")
                result = 1
            }
            print("3 this is an illegal timer, duration is ${illegal} }!\n")
            result = 1
        }

        return result
    }
}

func main() : Int64 {
    let cases : TestTimer = TestTimer()
    return cases.testException() | cases.test()
}
