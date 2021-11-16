// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
import macro define.*
from std import collection.*


func test<T>(input:T) where T <: Hashable & Equatable<T>{
    @M var a : HashMap<T,T> = HashMap<T,T>()
}

func main(){
    test<Int64>(1)
    return 0
}
