// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: Array<Aoo> = Array<Aoo>(2,{ i => Aoo(i) })
    a1[0].a ++
    a1[0] = Aoo(4)
    return 0
}

extend Array<T>{
    @Intrinsic
    operator func [](index:Int64,value:T):Unit{ // EXPECTED: regex-auto operator func [](Int64, Generics-T) of type Array<Generics-T> is a built-in function and cannot be overridden
        this[index+1] = value
        return ()
    }
}

class Aoo {
    var a: Int64 = 1
    let b: Int64 = 1
    init (x: Int64 ){ a = x }
}
