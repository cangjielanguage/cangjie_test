// DEPENDENCE: define.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo define=./define.cjo >> define.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> define.conf
// EXEC: %compiler %cmp_opt -i ast.conf define.cj -c
// EXEC: %compiler %cmp_opt -i define.conf  -backend-options="%libdir/../lib/libcangjie-common.so" %f ./define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define.*
import ast.*

interface I1<T>{
    let a = 1
    func f1(){}
    func f2():Unit
}

interface I2<T>{
    let b = 2
    func f3(){}
    func f4():Unit
}

open class C<T>{
    var c = 3
    open func f5(){}
}

class D{}

enum E{e}

func x(input:Int64){input}


@M
class A<T> <: C<T> & I1<T> &I2<T> where T <: D{
    var d : T
    init(input:T,b:Int64){
        this.d = input
    }
    init(input:T){
        this.d = input
    }
    public let e : Int64 = 0
    private let f : Int64 = 0
    protected let g : Int64 = 0
    static let h : Int64 = 0
    func f2(){}
    func f4(){}
    override func f5(){}
    static func f6<X>(){}
    private func f7(){}
    protected func f8(){}
    public func f9(){}
    open func f10(){}
    operator func +(a:A<T>,b:A<T>){0}

    func test(b:T,a!:Int64=1):T {
        func foo<T>(input:T):T{input}
        var y = (input:T):T=>{input}
        {b}
        var c = 1
        c = 2
        var my_x = x ~> x
        c = c |> my_x
        true&&true
        true||true
        true^^true
        a|a
        a^a
        a&a
        a+a-a*a/a%a**a
        !true
        ~a
        -a
        c++
        c--
        a>>a
        a<<a
        a<a
        a<=a
        a>a
        a>=a
        a==a
        a!=a
        x(1)
        var d = [a]
        d[0]
        var f = (a,a)
        f[0]
        if true {a} else {a}

        var e = E.e
        match e{
            case $e if false => 0
            case x : Int64 => 1
            case _ => 2
        }
        match 1{
            case $a => 1
            case _ => 0
        }
        while false {a}
        do{()}while false
        for i in 0...10{
            print("${a}")
            if false{
                continue
            } else {
                break
            }
        }
        `(1)
        quote(1)
        chr(1)
        ord('1')
        return b
    }

}

func main(){
    A<D>(D())
    return 0
}