// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data<T>{
    var a: T
    init(x: T){
        a = x
    }
    func foo():T{
        return a
    }
}


func main(): Int64 {
    Data<Float16>(2.10e-308).foo()    // EXPECTED: regex the number '2.10e-308' exceeds the value range of type 'Float16'
    return 0
}