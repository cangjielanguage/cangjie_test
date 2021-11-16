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
   var a:Coo<Boo,Int64> = Coo<Boo,Int64>()
   var b =  a.foo()
   return b
}


class Coo<K,V> where K <: Map<Int32,Int64> {
    func foo(){
        return 1
    }
}

class Boo <: Map<Int32,Int64> {

}