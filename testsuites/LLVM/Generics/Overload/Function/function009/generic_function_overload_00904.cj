// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped

class A<T>{
    func test(a:T){return 1}
    func test(a:T,b:Int64=1){return 2}
    var a : T
    func i(){
        var I = this.test(a) // EXPECTED: regex ambiguous match for function call
        return I
    }
}

func main():Int64{
    var I = A<Int64>(1).i()
    return 0
}