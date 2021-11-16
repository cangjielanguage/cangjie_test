// ERRCHECK: %compiler %cmp_opt %f -o %output


class A {
    ~init(){this()} // EXPECTED: regex invalid calling 'this' outside the constructor
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}