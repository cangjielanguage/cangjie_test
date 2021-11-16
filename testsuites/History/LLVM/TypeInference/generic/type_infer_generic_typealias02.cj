// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

//type 对类型变元的使用
type A1<T> = Data<T>
type A2<T> = (Array<T>)->Array<T>
type A3<T> = Book<Int32>
type A4<T> = Book<T>
type A6<T> = TimeUnit1<T>
type A7<T> = Ice<T>


//interface的操作符
interface Ice<T> {
    let a = 1
    let b = 2
    operator func !(operand: Ice<T>): Ice<T> {
        operand
    }
}
class Cream<T> <: Ice<T>{
    var a: T
    var b: T
    init(x:T, y: T){
        a = x
        b = y
    }
}

enum TimeUnit1<T> {
    Year(T)
}

class Data<T>{
    var a:T
    init(x:T){ a = x }
}

func Foo<T>(x:Array<T>):Array<T>{
    var a = x
    return a
}


record Book<T>{
    var a:T
    init(x:T){ a = x }
}

func test_typealias(){
    var a1:A1<Int32> = Data<Int32>(1)
    var a11:A1<Int32> = Data<Int32>(1)
    var a0:Int32 = 1
    var a2:A2<Int32> = Foo<Int32>
    var a3:A3<Int64> = Book<Int32>(2)
    var a4:A4<Int64> = Book<Int64>(2)
    var a6:A6<Int64> = TimeUnit1<Int64>.Year(1)
    var a7:A7<Int64> = Cream<Int64>(1,2)

}

func run():Int64{
    test_typealias()
    return 0
}
func main(): Int64 {
    return run()
}
