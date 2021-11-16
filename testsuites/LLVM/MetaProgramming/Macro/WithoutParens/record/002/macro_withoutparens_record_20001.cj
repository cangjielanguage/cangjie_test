// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*


record A{
    public var a : Int64
    //private let b : Int64 = 1
    //static let c : Int64 = 1
    public init(input:Int32){a = Int64(input)}
    //private init(){init(Int32(1))}
    //static func x(){}
    //private func y(){}
    //public func z(){}
    //func test(){}
    //operator func +(a:A,b:A){0}
}


func main(){
    //A(Int32(1))
    return 0
}