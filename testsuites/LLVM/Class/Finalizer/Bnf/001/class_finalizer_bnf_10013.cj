// ERRCHECK: %compiler %cmp_opt %f -o %output


class A {
    ~init(){var a : This = A()} // EXPECTED: regex 'This' type is not allowed here
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}