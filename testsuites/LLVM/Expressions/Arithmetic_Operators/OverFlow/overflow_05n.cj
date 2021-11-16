// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum Time{Day(Int32)}

func main(): Int64 {
    var time = Time.Day(2147483649) // EXPECTED: regex the number '2147483649' exceeds the value range of type 'Int32'
    var res = match (time) {
        case Day(x)=>x+1
    }
    print(res.toString())
    if (res == 2147483650) {
        return 0
    }
    return 1
}