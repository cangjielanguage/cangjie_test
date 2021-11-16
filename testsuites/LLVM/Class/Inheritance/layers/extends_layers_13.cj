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

open class Base4 <: Base3 {
    var test4 : Int32
    init() {
        test4 = test3 + 1
    }
}

open class Base5 <: Base4 {
    var test5 : Int32
    init() {
        test5 = test4 + 1
    }
}

open class Base6 <: Base5 {
    var test6 : Int32
    init() {
        test6 = test5 + 1
    }
}

open class Base7 <: Base6 {
    var test7 : Int32
    init() {
        test7 = test6 + 1
    }
}

open class Base8 <: Base7 {
    var test8 : Int32
    init() {
        test8 = test7 + 1
    }
}

open class Base9 <: Base8 {
    var test9 : Int32
    init() {
        test9 = test8 + 1
    }
}

class Data <: Base9 {
    var one : Int32
    init() {
        one = test1 + test2 + test3 + test4 + test5 + test6 + test7 + test8 + test9
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if (res != 45) {
        return 1
    }
    return 0
}