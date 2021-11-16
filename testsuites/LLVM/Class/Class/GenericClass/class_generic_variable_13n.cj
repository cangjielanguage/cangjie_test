// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    private var base: T
    init(x: T){
        base = x
    }

}


class Data<T> <: Base<Int32> {
    init(input:T){
        super(3)
    }
}

func main(): Int64 {
    var i1: Int32 = 5
    var data: Data<Int32> = Data<Int32>(i1)
    var res: Int32 = data.base   // EXPECTED: regex can not access field 'base'
    if(res == 3){
        return 0
    }
    return 1
}