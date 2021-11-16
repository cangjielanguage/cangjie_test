// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a1: Array<Aoo> = Array<Aoo>(2,{ i => Aoo(i) })
    a1[0].a ++
    if ( a1[0].a != 1 ){
        return 1
    }
    a1[Int32(0)] = Aoo(4)
    if ( a1[Int32(1)].a != 4 ){
        return 2
    }
    return 0
}

extend Array<T>{
    operator func [](index:Int32,value:T):Unit{
        this[Int64(1)] = value
    }
    operator func [](index:Int32){
        this[Int64(index)] 
    }
    static prop var set: Int64 {
        get() { return 1}
        set(v) {}
    }
}

class Aoo {
    var a: Int64 = 1
    let b: Int64 = 1
    init (x: Int64 ){ a = x }
}


