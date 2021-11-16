// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped

open class A<T>{
    func test(a:T){return 1}
    func test(a:T,b:Int64=1){return 2}

}

class B<T> <: A<T>{
    var a : T
    func i(){
        var I = super.test(a) // EXPECTED: regex ambiguous match for function call
        return I
    }
}

func main():Int64{
    var I = B<Int64>(1).i()
    return 0
}