// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data {
    var a: Int64 = 5

    Data(a: Int32){

    }
}

func run(): Int64 {
    var value : Data = Data() //EXPECTED: regex no matching constructor for call 'Data'
    return value.a - 5
}

func main(): Int64 {
    return run()
}
