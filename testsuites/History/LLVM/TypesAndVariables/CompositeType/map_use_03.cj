// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202106230NKPOUP0K00
func main(): Int64 {
    if ( test() != 1){
        return 1
    }
    return 0
}

func test(){
   var a:Map<Int64,Int32> = Map<Int64,Int32>(5,{x:Int64=>(x,1)})
   var b =  a.foo()
   return b
}


extend Map<K,V> where K <: Hashable, K <: Equatable<K> {
    func foo(){
        return 1
    }
}