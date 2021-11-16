package operator_overloading_00115a

external class A{
    operator func +(inputB:A):Int32{
        return 0
    }
    static func test(){}
}

external record B{
    operator func +(inputB:B):Int32{
        return 0
    }
    func test(){}
}

external interface C{
    operator func +(inputB:C):Int32{
        return 0
    }
    static func test(){}
}

external class D <: C{}
