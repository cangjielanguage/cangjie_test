// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( test() != 1){
        return 1
    }
    return 0
}

func test(){
 var a:Map<Coo<Int64,Int32>,Int64> = Map<Coo<Int64,Int32>,Int64>(5,{x:Int64=>(Coo<Int64,Int32>(x),1)})
 var b =  a.get(Coo<Int64,Int32>(1))
 return match (b){
     case Some(x) => x
     case None => 100
 }
}


class Coo<K,V> <: Map<K,V>  & Hashable & Equatable<Coo<K,V>> where K <: Hashable, K <: Equatable<K> {
    var x:Int64
    init(x:Int64){this.x = x}
    operator func ==(right : Coo<K,V> ) : Bool {
        return true
    }
    operator func !=(right : Coo<K,V> ) : Bool {
        return false
    }
}