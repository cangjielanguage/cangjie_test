// ERRCHECK: %compiler %cmp_opt %f -o %output


var x = A()

class A {
    ~init(){x = foo()} // EXPECTED: regex undeclared identifier 'foo'
}


extend A{
    func foo(){this}
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}