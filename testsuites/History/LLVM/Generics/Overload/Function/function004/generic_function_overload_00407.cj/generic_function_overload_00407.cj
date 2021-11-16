// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan class_instantiation


record R<T>{}
func test(a:R<Int64>){print("top")}
trait TR{func test(a:This):Unit}
append<T> R<T> with TR {func test(a:R<T>){print("append")}}

func test<T>(a:T){print("generic_top")}
class A<T>{
    func test(a:T){print("class_normal")}
    func test(a:R<T>){print("class_generic")}
    func test(a:R<Int64>){print("class_instantiation")}
    func i(){
        var I = test(R<Int64>())
    }
}


func main():Int64{
    A<Int32>().i()
    return 0
}