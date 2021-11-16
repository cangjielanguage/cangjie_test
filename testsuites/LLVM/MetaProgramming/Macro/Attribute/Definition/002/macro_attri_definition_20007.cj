// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

record A{
    public var a : Int64
    private let b : Int64 = 1
    static let c : Int64 = 1
    public init(input:Int64){this.a = input}
    private init(input:Int32){this.a = Int64(input)}
    static func x(){}
    private func y(){}
    public func z(){}
    func test(){}
    operator func +(b:A){0}
}

external macro M(attr:Tokens,input:Tokens):Tokens{
    A(1)
    return quote(0)
}