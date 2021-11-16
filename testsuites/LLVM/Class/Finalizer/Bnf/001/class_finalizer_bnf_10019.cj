// ERRCHECK: %compiler %cmp_opt %f -o %output


var x = A()

open class A {
}

class B <: A{
    ~init(){x = a} // EXPECTED: regex 'a' cannot be captured in the finalizer
}

extend A{
    prop let a : A{
        get(){this}
    }
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}