// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add{
    func add(a: This,b: Int32): Int32
}

append Int32 with Add{
    func add(a: Int32, b: Int32): Int32 {
        return a + b
    }
}

trait Num<V> where This <: Add {
    func chooseOne(a: This, b: V): V
}

append<U> Int32 with Num<U>{
    func chooseOne(a: Int32, b: U): U { return b }
}


class Data<T> where T <: Num<Int32> {
    var a: T
    init(x: T){
        a = x
    }
}

func run(): Int64 {
    var a: Int32 = 2
    var b: String = "hello"
    var data: Data<Int32> = Data<Int32>(2)
    let res1: Int32 = add(data.a, a)
    let res2: String  = chooseOne(data.a, b)
    if (res1 == 4 && res2 == "hello") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


