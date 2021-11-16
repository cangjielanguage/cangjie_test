// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex-auto LoopEnumTest: year=2022
// ASSERT: regex-auto LoopEnumTest: day=24
// ASSERT: regex-auto LoopEnumTest: year=2023
// ASSERT: regex-auto LoopEnumTest: day=26

enum TimeUnit<T> {
    Year(T) | Day(T, Int32)
}

func run(): Int64 {

    var rows: Array<Int32> = @{2, 3}
    for (index in rows) {
        var time1 = TimeUnit<Int32>.Year(index)
        var time2 = Day<Int32>(index-1, index+1)
        var year = match (time1) {
            case Year(x) => 2020+x
            case Day(x, y) => 20+x+y
        }
        var day = match (time2) {
            case Year(x) => 2020+x
            case Day(x, y) => 20+x+y
        }
        print("LoopEnumTest: year=" + year.toString() + "\n")
        print("LoopEnumTest: day=" + day.toString() + "\n")
    }
    return 0
}

func main(): Int64 {
    return run()
}
