// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var list1:List<String> = ["a","b","c"]

func main(): Int64 {
    if ( test() != 1){
        return 1
    }
    return 0
}

func test(){
   var a:Buffer<String> = Buffer<String>(list1)
   var b =  a.foo()
   return b
}


extend Buffer<T>  {
    func foo(){
        return 1
    }
}
