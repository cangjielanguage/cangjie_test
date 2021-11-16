// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    let width: Int32
    let length: Int32
    init(x: Int32, y: Int32){
        width = x
        length = y
    }
    func area(): Int32{
        return length*width
    }
}

class Test {
    let data1: Data = Data(2, 3)
    let data2: Data
    init(x: Data){
        data2 = x
    }
    func f(x: Data): Data{
        return x
    }
}

func run(): Int64 {
    var d1: Data = Data(3, 4)
    var d2: Data = Data(4, 4)
    var test: Test = Test(d1)
    let res1: Data = test.data1
    let res2: Data = test.data2
    let res3: Data = test.f(d2)
    if ( res1.area() == 6 && res2.area() == 12 && res3.area() == 16) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
