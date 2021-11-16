// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// ERRCHECK: %compiler %cmp_opt %f -import-config a.cfg a.o -o %output
// ASSERT: regex-not core dumped

package pkg404
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
    A<Int64>().i() // EXPECTED: regex instantiation 'A<Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64>'
    return 0
}