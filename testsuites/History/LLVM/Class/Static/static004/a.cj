package a

external interface A{
    let a = 1
    static func test(input!:Int32,input2!:Int64=1):Int64{1}
    static func test(input!:Int64,input2!:Int64=1):Int64{2}
}

external class B{
    static let a = 1
    static func test(input!:Int32,input2!:Int64=1):Int64{1}
    static func test(input!:Int64,input2!:Int64=1):Int64{2}
}

external abstract class C{
    static let a = 1
    static func test(input!:Int32,input2!:Int64=1):Int64{1}
    static func test(input!:Int64,input2!:Int64=1):Int64{2}
}
