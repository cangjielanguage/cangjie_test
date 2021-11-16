// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Foo<T>{
    var data: T
    Foo(data1: T){
        data = data1
    }
}

record Data{
    var width: Int32 = 1
    var length: Int32 =2
    Data(width1:Int32, length1: Int32){
        width = width1
        length = length1
    }
    func area(): Int32 {
        return width*length
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data = Data(a, b)
    var foo: Foo<Data> = Foo<Data>(data)
    res = foo.data.area()
    if (res == 12){
        return 0
    }
    return 1
}
