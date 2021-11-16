// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped

class A<T>{
    func f (a: T, b:Int64=1): Int64 {1} //f1
    func f (a: T): Int64 {2} //f2
    func test(input:T) {f(input)}  // EXPECTED: regex ambiguous match for function call
}


func main(){
    1
}