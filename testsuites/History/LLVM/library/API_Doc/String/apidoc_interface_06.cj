// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( Aoo(1).size() != 1 ){
        return 1
    }
    if ( Aoo(0).isEmpty() ) {
        return 0
    }
    return 3
}

class Aoo <: Collection<Aoo>{
    var a : Int64 = 0
    init(x:Int64){
        a =x
    }
    func size():Int64{
        return a
    }
    func isEmpty():Bool{
        if ( a == 0 ){
            return true
        } else{
            return false
        }
    }
    func iterator():Iterator<Aoo>{
        return AooIterator<Aoo>(1)
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
