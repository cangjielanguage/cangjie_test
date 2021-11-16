// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A<T>{
    func test(a:Int64){return 1}
    func test(a:T){return 2}
    var a : T
    init(input:T){a = input}
    func i(){
        var j = this.test(a)
        return j
    }
}


func main():Int64{
    var res1 = A<Int16>(1).i()
    if (res1 != 2) {
        return 1
    }
    return 0
}