// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var i: Int32 = 2
    init(){
        i = i+1
    }
    init(x: Int32){
        this()
        i = this.i+x
    }
}

class Data<T> {
    var i1: T
    var i2: T
    init(x: T){
        i2 = x
        i1 = this.i2
    }
}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3)
    var res1: Int32 = test.i
    var res2: Int32 = data.i1
    if(res1 == 5 && res2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
