// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test(input:Int64){print("top")}
open class A<T>{
    func test(a:T){print("inside")}
    var i : T
    init(a: T) { this.i = a }
    func b(){
        test(i)
    }
return 1;}  // EXPECTED: regex illegal class member in class block

func main():Int64{
    A<Int64>(0).b()
    return 0
}
