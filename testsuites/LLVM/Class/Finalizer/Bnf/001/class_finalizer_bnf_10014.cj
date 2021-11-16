// ERRCHECK: %compiler %cmp_opt %f -o %output


var x = A()

class A {
    prop let a : A{
        get(){this}
    }
    ~init(){x = a} // EXPECTED: regex 'a' cannot be captured in the finalizer
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}