// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped

class A<T>{
    static func f (a: T, b:Int64=1): Int64 {1} //f1
    static func f (a: T): Int64 {2} //f2
}


func main(){
    A<Int32>.f(1)  // EXPECTED: regex ambiguous match for function call
    1
}