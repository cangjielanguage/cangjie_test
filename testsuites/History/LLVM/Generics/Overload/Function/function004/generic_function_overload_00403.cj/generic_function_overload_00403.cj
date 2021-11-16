// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// EXEC: %compiler %cmp_opt %f -import-config a.cfg a.o -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan class_normal

package pkg403
import a.*

func test(a:Int32){print("top_normal")}
trait TR{func test(a:This):Unit}
append Int64 with TR{func test(a:Int64){print("trait")}}
func test<T>(a:T){}
class A<T>{
    func test(a:T){print("class_generic")}
    func test(a:Int64){print("class_normal")}
    func i(){
        let I = test(1)
    }
}


func main():Int64{
    A<Int32>().i()
    return 0
}