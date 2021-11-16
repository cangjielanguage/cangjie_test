// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a :List<Int64> = List<Int64>()
    var b = sumInt(a)
    var c = b.elem
    var d = b.tail
    var res1 = match (c) {
        case Some(x) => x
        case None => 1
    }
    if ( res1 != 1 ){
        return 1
    }
    var res2 = match (d) {
        case Some(x) => 0
        case None => 1
    }
    if ( res2 != 1 ){
        return 1
    }
    return 0
}

class List<T> {
    var elem : Option<T> = None
    var tail : Option<List<T>> = None
}

func sumInt(a:List<Int64>){ return a }