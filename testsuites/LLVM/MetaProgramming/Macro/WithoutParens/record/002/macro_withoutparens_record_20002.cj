// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

class D{}

enum E{e}

func x(input:Int64){input}

@M
record A<T> where T <: D{
    public var a : T
    private let b : Int64 = 1
    static let c : Int64 = 1
    private init(input:T){this.a = input}
    public init(input:T,input_b:Int64){
        var temp = input
        this.a = input
    }
    static func x<X>(){}
    private func y(){}
    public func z(){}
    operator func +(b:A<T>){0}
    func test(b:T,a!:Int64=1):T {
        func foo<T>(input:T):T{input}
        var y = { input:T => input}
        {b}
        var c = 1
        c = 2
        var my_x = x ~> x
        c = c |> my_x
        true&&true
        true||true
//        true^^true
        a|a
        a^a
        a&a
        a+a-a*a/a%a**a
        !true
        !a
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
        if (true) {a} else {a}

        var e1 = E.e
        match (e1){
            case $e if (false) => 0
            case x : Int64 => 1
            case _ => 2
        }
        match (1){
            case $a => 1
            case _ => 0
        }
        while (false) {a}
        do{()} while (false)
        for (i in 0..10) {
            print("${a}")
            if (false) {
                continue
            } else {
                break
            }
        }
        chr(1)
        ord('1')
        return b
    }
}


func main(){
    A<D>(D(),1)
    return 0
}
