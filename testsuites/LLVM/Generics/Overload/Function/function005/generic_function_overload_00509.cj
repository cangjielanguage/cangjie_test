// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
open class A<T> {
    func test(a:Int64){return 1}
    func test(a:T){return 2}
}

class B<T> <: A<T> {
    var a : T
    init(input:T){a = input}

    func test(a:Int32){ return 3 }
    func i(){
        var j = this.test(a)
        return j
    }
}


func main():Int64{
    var res1 = B<Int32>(1).i() // EXPECTED: regex instantiation 'B<Int32>' causes ambiguous functions named 'test' between declaration 'B<Int32>' and declaration 'A<Int32>'
    var res2 = B<Int64>(1).i() // EXPECTED: regex instantiation 'B<Int64>' causes ambiguous functions named 'test' in declaration 'A<Int64>'
    return 0
}