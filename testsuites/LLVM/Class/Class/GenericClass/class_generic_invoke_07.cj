// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let width: T
    let length: T
    init(x: T, y: T){
        width = x
        length = y
    }
}


record Foo {
    var i1: Int32 = 4
    var i2: Int32 = 6
    var data: Data<Int32> = Data<Int32>(i1, i2)
}

func run(): Int64 {
    var foo: Foo = Foo()
    var data: Data<Int32> = foo.data
    var width: Int32 = data.width
    var length: Int32 = data.length
    if ( width == 4 && length == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
