// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var x = A()

class A {
    static prop let a : A{
        get(){A()}
    }
    ~init(){x = a}
}

func test(){
    var a = A()
}

func main(){
    test()
    return 0
}