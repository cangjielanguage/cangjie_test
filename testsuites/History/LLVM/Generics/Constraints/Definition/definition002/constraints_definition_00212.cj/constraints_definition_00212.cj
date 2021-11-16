// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{
    func f0(a:This,b:Bool):Unit
    func f1(a:This):Unit
}

open class Y{
    func f2(){print("class")}
    var y_i = 1
}

interface Z{
    func f3(){print("interface")}
}

class A <: Y & Z{}

append Y with X{
    func f0(a:Y,b:Bool){print("append0")}
    func f1(a:Y){print("append1")}
}

func test<T>(input:T) where T <: X,T<:Y,T<:Z{
    input.f0(true)
    f0(input,true)
    f1(input)
    input.f2()
    input.f3()
    input.y_i
}

record R<T> where T <: X,T<:Y,T<:Z{
    var i : T
    init(input:T){
        i = input
        /*
        input.f0(true)
        f0(input,true)
        f1(input)
        input.f2()
        input.f3()
        input.y_i
        */

    }
}

enum E<T> where T <: X,T<:Y,T<:Z{e}

class C<T> where T <: X,T<:Y,T<:Z{
    init(input:T){
        input.f0(true)
        f0(input,true)
        f1(input)
        input.f2()
        input.f3()
        input.y_i
    }
}

interface I<T> where T <: X,T<:Y,T<:Z{}

append<T> R<T> with X where T <: X,T<:Y,T<:Z{
    func f0(a:R<T>,b:Bool){
        input.y_i
        var input = a.i
        input.f0(true)
        f0(input,true)
        f1(input)
        input.f2()
        input.f3()

    }

    func f1(a:R<T>){
        input.y_i
        var input = a.i
        input.f0(true)
        f0(input,true)
        f1(input)
        input.f2()
        input.f3()
    }
}

func main():Int64{
    return 0
}
