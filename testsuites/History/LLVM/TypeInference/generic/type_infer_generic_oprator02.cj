// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

//操作符函数中对类型变元的使用

// trait操作符
class Data<T> {
    var a: T
    init(x: T){
        a = x
    }
}
trait Add {
    operator func + (left: This, right: This): This
}
append Data<Int32> with Add {
    operator func + (left: Data<Int32>, right: Data<Int32>): Data<Int32>{
        Data<Int32>(left.a+right.a)
    }
}

//class的操作符
class Day<T> {
    var a: T
    var b: T
    init(x: T,y:T){
        a = x
        b = y
    }
    operator func !(operand: Day<T>): Day<T> {
        Day<T>(operand.b,operand.a)
    }
}

//record操作符
record Time<T> {
    var a: T
    var b: T
    init(x:T, y: T){
        a = x
        b = y
    }
    operator func -(operand: Time<T>): Time<T>{
        Time<T>(operand.b, operand.a)
    }
}

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

func test_function_call():Int64{
    var data1 = Data<Int32>(1)
    var data2 = Data<Int32>(2)
    var data3 = data1 + data2
    let res1 = data3.a
    if res1 != 3 {return 1}

    var day1 = Day<Int32>(4,5)
    var day2 = !day1
    let res2 = day2.a
    if res2 != 5 {return 1}

    var time1 = Time<Int32>(6,7)
    var time2 = -time1
    let res3 = time2.a // 7
    let res4 = time2.b // 6
    if res3 != 7 || res4 != 6 { return 1 }
    return 0

}

func run():Int64{
    return test_function_call()
}
func main(): Int64 {
    return run()
}
