// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo(x: Int64) :Int64 {
    return x + 1
}

func bar(x: Int64) :Int64 {
    x + 1
}

class Data{
    var dt: Int64 = 1
    init(x: Int64, y: Int32){
        dt = x
    }
}

trait Num{
    func add(x: This, y: Int32): Int64
}

append Int64 with Num {
    func add(x: Int64, y: Int32): Int64{
        return x
    }
}

enum Test{ Do| Ho }

// 二元运算表达式结果再使用
func main(): Int64 {

    var i1 = 1 + 1
    var i2 = 3 - 2
    var i3 = 2 * 1
    var i4 = 4 / 2
    var i5 = 5 % 3
    var i6 = 2 << 1

    var int_1 = i1
    var int_2 = i6 >> i2

    // 条件操作符
    var int_3 = if(i6>2) {i2} else {3}
    //函数入参/构造函数/trait入参/函数返回表达式/函数返回值
    var int_4 = foo(i3)
    var int_5 = Data(i4, 2).dt //2
    var int_6 = add(i5, 3) //2

    // 函数最后一句表达式
    var int_7 = bar(i2) // 2
    // lambda表达式的入参/最后一句表达式
    var func_lambda = { x:Int64, y:Int64 =>  x+y }
    var int_8 = func_lambda(i1, i2) // 3

    // if-else 表达式
    var int_10 = 0
    if (i2 > 1) {
        int_10 = i2
    } else {
        int_10 = i1
    }
    // match 表达式
    var int_11 = match (Test.Ho) {
        case $Do => i1
        case $Ho => i2
    }
    // block 表达式
    { var int_11 = 3}

    if (int_1 == 2 && int_2 == 2 && int_3 == 1 && int_4 == 3 && int_5 == 2 && int_6 == 2 && int_7 == 2 && int_8 == 3 && int_10 == 2 && int_11 == 1) {
        return 0
    }
    return 1
}
