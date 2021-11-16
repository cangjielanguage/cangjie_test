// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class ClassData<T> {
    var a: T
    init(x: T){
        a = x
    }
}

type CD = ClassData<Int32>

func main(): Int64 {
    var cd1: CD = ClassData<Int32>(2)
    var cd2: ClassData<Int32> = ClassData<Int32>(2)
    if (cd1.a == cd2.a) {
        return 0
    }
    return 1
}