// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


open class Base<T> {
    static var a: Int32 = 2
}

class Data<T> <: Base<T> {
    var a: Int32 = 3 // EXPECTED: regex-auto non-static member 'a' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {
    var base: Base<Int32> = Base<Int32>()
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.a
    if(res == 3){
        return 0
    }
    return 1
}