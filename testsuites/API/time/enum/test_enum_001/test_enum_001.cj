// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception

from std import time.*

class TestEnum {
    func test() {
        var result = 0
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        for (i in 1..=12) {
            let month = Month.of(i).getOrThrow()
            if (month.toString() != monthNames[i - 1]) {
                print("Test function of, the expect is ${monthNames[i - 1]}, the actual is ${month.toString()}\n")
                result = 1
            }
            if (month.value() != i) {
                print("Test function value, the expect is ${i}, the actual is ${month.value()}\n")
                result = 1
            }
        }

        let weekNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        for (i in 0..=6) {
            let weekday = Weekday.of(i).getOrThrow()
            if (weekday.toString() != weekNames[i]) {
                print("Test function of, the expect is ${weekNames[i]}, the actual is ${weekday.toString()}\n")
                result = 1
            }
            if (weekday.value() != i) {
                print("Test function value, the expect is ${i}, the actual is ${weekday.value()}\n")
                result = 1
            }
        }

        let months = [0, 13]
        for (num in months) {
            try {
                let time = Month.of(num).getOrThrow()
                print("num: " + num.toString() + "\n")
            } catch (_) {
                continue
            }
            print("Month of ${num} should throw exception!\n")
            result = 1
        }

        let weekdays = [-1, 7]
        for (num in weekdays) {
            try {
                let time = Weekday.of(num).getOrThrow()
            } catch (_) {
                continue
            }
            print("Weekday of ${num} should throw exception!\n")
            result = 1
        }

        return result
    }
}

func main() : Int64 {
    let cases = TestEnum()
    return cases.test()
}
