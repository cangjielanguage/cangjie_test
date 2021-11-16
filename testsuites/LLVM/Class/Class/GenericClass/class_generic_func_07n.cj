// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Base<T> {
    private func foo(x: T): T{
        return x
    }

}

class Data<T> <: Base<T> {
    init(x: T){}
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>() // EXPECTED: regex no matching constructor for call 'Data'
    var res: Int32 = data.foo(3)
    return 0
}
