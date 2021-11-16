// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


enum Coo<T> {
    A | B
    static func foo<V>(x: V): V{
        return x
    }
}

func main(): Int64 {
    var i: Int32 = 3
    var res: Int32 = Coo<String>.foo<Int32>(i)
    if(res == 3){
        return 0
    }
    return 1
}