// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

class Foo<T>{
    var data: T
    init(data1: T){
        data = data1
    }
}

class Data<T>{
    let count: T
    init(x: T){
        count = x
    }
}

type Fo<T> = Foo<T>

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(3)
    var foo: Foo<Data<Int32>> = Foo<Data<Int32>>(data)
    var res: Int32 = foo.data.count
    if (res == 3){
        return 0
    }
    return 1
}
