// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
open class A<T>{
    func test(a:Int64){return 1}
    func test(a:T){return 2}
    var a : T
    init(input:T){a = input}
    func i(){
        var i = this.test(a)
        return i
    }
}


func main():Int64{
    var res1 = A<Int64>(1).i() // EXPECTED: regex instantiation 'A<Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64>'
    if (res1 != 2) {
        return 1
    }
    return 0
}