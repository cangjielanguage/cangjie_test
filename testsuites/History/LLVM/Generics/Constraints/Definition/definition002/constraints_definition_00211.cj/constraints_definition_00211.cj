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

append Y with X{
    func f0(a:A,b:Bool){print("append0")}
    func f1(a:A){print("append1")}
}

func test<T>(input:T) where T <: X&Y&Z{
    input.y_i
    input.f0(true)
    f0(input,true)
    f1(input)
    input.f2()
    input.f3()
}

record R<T> where T <: X&Y&Z{
    var i : T
    init(input:T){
        input.y_i
        i = input
        input.f0(true)
        f0(input,true)
        f1(input)
        input.f2()
        input.f3()
    }
}

enum E<T> where T <: X&Y&Z{e}

class C<T> where T <: X&Y&Z{
    init(input:T){
        input.y_i
        input.f0(true)
        f0(input,true)
        f1(input)
        input.f2()
        input.f3()
    }
}

interface I<T> where T <: X&Y&Z{}

append<T> R<T> with X where T<:X&Y&Z{
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
