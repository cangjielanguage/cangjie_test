// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class Base<T> {
    var a: T
    init(x: T){
        a = x
    }

}

class Data<T> <: Base<Int32> {
    var a: T       // EXPECTED: regex the variable 'a' must not shadow a member variable of the supertype
    init(input:T){
    super(0)
        a = input
    }
}

func main(): Int64 {
    var base: Base<Int32> = Base<Int32>(3)
    var data: Data<Int32> = Data<Int32>(5)
    var res: Int32 = data.a
    if(res == 5){
        return 0
    }
    return 1
}
