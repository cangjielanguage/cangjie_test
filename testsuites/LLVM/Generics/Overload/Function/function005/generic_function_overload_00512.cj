// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

open class I<T>{
    func test(a:T){return 1}
    func test(a:Int64){return 2}
}
open class A<T> <: I<T>{
    func test(a:Int32){return 3}
}

class B<T> <: A<T>{
    func test(a:Int16){return 4}
    var i : T
    init(input:T){i = input}
    func a(){
    var I = super.test(i)
    return I
    }
}


func main():Int64{
    var res1 = B<Int16>(1).a() // EXPECTED: regex instantiation 'B<Int16>' causes ambiguous functions named 'test' between declaration 'B<Int16>' and declaration 'I<Int16>'
    var res2 = B<Int32>(1).a() // EXPECTED: regex instantiation 'B<Int32>' causes ambiguous functions named 'test' between declaration 'A<Int32>' and declaration 'I<Int32>'
    var res3 = B<Int64>(1).a() // EXPECTED: regex instantiation 'B<Int64>' causes ambiguous functions named 'test' in declaration 'I<Int64>'
    return 0
}