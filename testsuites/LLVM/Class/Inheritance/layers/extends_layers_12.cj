// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base1 {
    var test1 : Int32 = 1
}

open class Base2 <: Base1 {
    var test2 : Int32
    init() {
        test2 = test1 + 1
    }
}

open class Base3 <: Base2 {
    var test3 : Int32
    init() {
        test3 = test2 + 1
    }
}

open class Base4 <: Base3{
    var test4 : Int32
    init() {
        test4 = test3 + 1
    }
}

class Data <: Base4 {
    var one : Int32
    init() {
        one = test1 + test2 + test3 + test4
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if (res != 10) {
        return 1
    }
    return 0
}