// DEPENDENCE: main.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo define=./%n.cjo >> main.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> main.conf
// EXEC: %compiler -i ast.conf %f -c
// EXEC: %compiler -i main.conf main.cj ./%n.o  -backend-options=%libdir/../lib/libcangjie-common.so -o %output
// EXEC: %run %run_opt %output

package define

import ast.*

interface I1{
    let a = 1
    func f1(){}
    func f2():Unit
}

interface I2{
    let b = 2
    func f3(){}
    func f4():Unit
}

open class C{
    var c = 3
    open func f5(){}
}

class A <: C & I1 & I2{
    var d : Int64
    init(){
        this.d = 0
    }
    init(input!:Int64 = 0){
        this.d = input
    }
    public let e : Int64 = 0
    private let f : Int64 = 0
    protected let g : Int64 = 0
    static let h : Int64 = 0
    func f2(){}
    func f4(){}
    override func f5(){}
    static func f6(){}
    private func f7(){}
    protected func f8(){}
    public func f9(){}
    open func f10(){}
    operator func +(a:A,b:A){0}
}

external macro M(attr:Tokens,input:Tokens):Tokens{
    C()
    return quote(0)
}