// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt main.cj %macro_lib_opt -o %output
// EXEC: %run %run_opt %output %run_args

package define

from ast import ast.*

class D{}


func x(input:Int64){input}

record A<T> where T <: D{
    public var a : T
    private let b : Int64 = 1
    static let c : Int64 = 1
    public init(input:T){this.a = input}
    private init(input:T,input_b!:Int64=1){
        var temp = input
        this.a = input
    }
    static func x<X>(){}
    private func y(){}
    public func z(){}
    operator func +(b:T){0}
}
external macro M(attr:Tokens,input:Tokens):Tokens{
    A<D>(D())
    return quote(0)
}