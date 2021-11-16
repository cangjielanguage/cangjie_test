// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

enum TimeUnit {
    | Year(Int32)
    | Month(Int32, Int32)
    | Day(Int32, Int32, Int32)
    | Hour(Int32, Int32, Int32, Float32)
}

func main() : Int64 {
    let x = TimeUnit.Hour(2021, 1, 1, 1)
    let dateString = match (x) {
        case Year(y) | Month(y, m) => y      // error: different number of variables are introduced in enum pattern
        case Year(y) | Month(_, m) => y      // error: different name of variables are introduced in enum pattern
        case Year(y) | Month(y, _) => y      //OK
        case Year(a) | Hour(_, _, _, a) => a  // error: different type of variables are introduced in enum pattern
        case _ => 0
    }
    0
}
