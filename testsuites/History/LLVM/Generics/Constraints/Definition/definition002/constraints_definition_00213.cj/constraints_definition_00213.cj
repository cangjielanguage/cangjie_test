// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{
    operator func !(a:This):Unit
}

open class Y{
    operator func +(a:Y,b:Y){print("class_operator")}
}

interface Z{
    operator func -(a:Z,b:Z){print("interface_operator")}
}

func test<T>(input:T) where T <: X&Y&Z{
    !input
    input+input
    input-input
}

record R<T> where T <: X&Y&Z{
    var i : T
    init(input:T){
        i = input
        !input
        input+input
        input-input
    }
}

enum E<T> where T <: X&Y&Z{e}

class C<T> where T <: X&Y&Z{
    init(input:T){
        input.y_i
        !input
        input+input
        input-input
    }
}

interface I<T> where T <: X&Y&Z{}

append<T> R<T> with X where T<:X&Y&Z{
    opearator func !(a:R<T>){
        !a.i
        a.i+a.i
        a.i-a.i
    }
}

func main():Int64{
    return 0
}
