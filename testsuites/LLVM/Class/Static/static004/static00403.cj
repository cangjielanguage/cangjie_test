// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    static func test(input!:Int32,input2!:Int64):Int64{1}
    static func test(input!:Int64,input2!:Int64):Int64{2}
}

class Test <: A{}

class B{
    static func test(input!:Int32,input2!:Int64=1):Int64{1}
    static func test(input!:Int64,input2!:Int64=1):Int64{2}
}

abstract class C{
    static func test(input!:Int32,input2!:Int64=1):Int64{1}
    static func test(input!:Int64,input2!:Int64=1):Int64{2}
}

func main(){
    if (Test.test(input:1,input2:1) != 2) {
        return 1
    }
    if (B.test(input:1) != 2) {
        return 2
    }
    if (C.test(input:1) != 2) {
        return 3
    }
    return 0
}
