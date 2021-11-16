// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A{
    init(input:Int64){}
    var b : Int64 = 0
    operator func ()(input:Int64){input}
}

class B <: A {
    init() { // EXPECTED: regex there is no non-parameter constructor in super class, please invoke super call explicitly
        1 |> super
    }
}

func main(): Int64 {
    B()
    return 0
}
