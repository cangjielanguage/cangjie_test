// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// EXEC: %compiler %cmp_opt %f -import-config a.cfg a.o -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan pkga_normal

package pkg406
import a.*

func test(a:Int32){print("top_normal")}
trait TR{func test(a:This):Unit}
append Int8 with TR{func test(a:Int8){print("trait")}}
class A<T>{
    func test(a:T){print("class_generic")}
    func test(a:Int16){print("class_normal")}
    func i(){
        test(Int64(1))
    }
}


func main():Int64{
    A<Int32>().i()
    return 0
}