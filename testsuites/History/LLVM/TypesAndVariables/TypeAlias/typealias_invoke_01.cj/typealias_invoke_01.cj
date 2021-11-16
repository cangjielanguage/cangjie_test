// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait Num{
    func add(x: This, y: This): Int32
}

append Int32 with Num{
    func add(x: Int32, y: Int32): Int32{
        return x+y
    }
}

class ClassData<T> where T<: Num{
    var a: T
    init(x: T){
        a = x
    }
}

type CD<T> = ClassData<T>

func main(): Int64 {
    var cd1: CD<Int32> = ClassData<Int32>(2)
    var cd2: ClassData<Int32> = ClassData<Int32>(2)
    var res: Int32 = add(cd1.a, cd2.a)
    if (res == 4) {
        return 0
    }
    return 1
}