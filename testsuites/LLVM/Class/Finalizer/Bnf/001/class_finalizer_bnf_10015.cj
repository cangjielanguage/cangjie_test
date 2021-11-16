// ERRCHECK: %compiler %cmp_opt %f -o %output


var x = A()

class A {
    let a : A = this // EXPECTED: regex 'this' is not allowed to initialize non-static member
    ~init(){a}
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}