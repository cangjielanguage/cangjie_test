// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }
}

class Foo {
    var data: Data<Int32>
    init(x: Data<Int32>){
        data = x
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(3, 4)
    var foo: Foo = Foo(data)
    var res1: Int32 = foo.data.x
    var res2: Int32 = foo.data.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
