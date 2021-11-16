// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var i: Int32 = 2
    init(){}
    Test(x: Int32){
        i = this.i+x
    }
}

class Data<T> {
    var i1: T
    var i2: T
    Data(x: T){
        i2 = x
        i1 = this.i2
    }
}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3)
    if(test.i == 4 && data.i1 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
