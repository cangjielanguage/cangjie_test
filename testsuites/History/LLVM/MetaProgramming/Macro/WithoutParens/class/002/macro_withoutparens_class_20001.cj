// DEPENDENCE: define.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo "define=./define.cjo" >>define.conf
// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" >> define.conf
// EXEC: %compiler %cmp_opt -i ast.conf define.cj -c
// EXEC: %compiler %cmp_opt -i define.conf  -backend-options="%libdir/../lib/libcangjie-common.so" %f ./define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

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

@M
class A <: C & I1 &I2{
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

func main(){
    A(input:1)
    return 0
}