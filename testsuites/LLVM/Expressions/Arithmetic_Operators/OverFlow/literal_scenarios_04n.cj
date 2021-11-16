// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data{
    var a = .3243
    init(x: Float64){
        a = x
    }
    func foo(): Float64{
        return a
    }
}


func main(): Int64 {
    Data(2.10e-308).foo()    // EXPECTED: regex  the number '2.10e-308' exceeds the value range of type 'Float64'
    return 0
}