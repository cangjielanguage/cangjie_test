// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f

// ASSERT: scan This is the first output!
// ASSERT: scan 1
// ASSERT: scan 2
// ASSERT: scan 3

from std import time.*

class TestTicker {
    func test() {
        let durationTicker = Ticker(Duration.millisecond(100), { print("1\n") })

        var result = 0
        // 未启动时停止
        durationTicker.stop()
        sleep(200000000)
        print("This is the first output!\n")

        durationTicker.reset(Duration.millisecond(100))
        sleep(200000000)

        durationTicker.reset(Duration.millisecond(100), { print("2\n")})
        sleep(200000000)

        durationTicker.reset(Duration.millisecond(100))

        durationTicker.reset(Duration.millisecond(200), { print("3\n") })
        sleep(200000000)

        return result
    }

    func testException() {
        var result = 0
        let durationTicker = Ticker(Duration.second(3), { print("1") })

        let illegalDuratioin = [Duration.second(0), Duration.second(-1)]

        for (illegal in illegalDuratioin) {
            try {
                let timer = Ticker(illegal, { print("this is an illegal timer, duration is ${illegal} }!\n") })
            } catch (_) {
                try {
                    durationTicker.reset(illegal)
                } catch (_) {
                    try {
                        durationTicker.reset(illegal, { print("3") })
                    } catch (_) {
                        continue
                    }
                    print("this is an illegal time for durationTicker.reset!\n")
                    result = 1
                }
                print("this is an illegal time for durationTicker.reset!\n")
                result = 1
            }
            print("this is an illegal ticker, duration is ${illegal} }!\n")
            result = 1
        }

        return result
    }
}

func main() : Int64 {
    let cases : TestTicker = TestTicker()
    return cases.testException() | cases.test()
}
