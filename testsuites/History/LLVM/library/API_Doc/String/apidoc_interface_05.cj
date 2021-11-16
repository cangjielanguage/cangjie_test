// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    for ( i in AooIterator<Int64>(1) ){
        print("${i}")
    }
    var a = Aoo<Int64>(1).iterator()
    for ( i in a ){
        print("${i}")
    }
    return 0
}

class Aoo<T> <: Iterable<T>{
    var a : Int64 = 0
    init(x:Int64){
        a =x
    }
    func iterator():Iterator<T>{
        return AooIterator<T>(1)
    }
}

class AooIterator<T> <: Iterator<T>{
    var a : Int64 = 0
    init(x:Int64){
        a =x
    }
    func iterator():Iterator<T>{
        return this
    }
    func next():Option<T>{
        return None
    }
}
