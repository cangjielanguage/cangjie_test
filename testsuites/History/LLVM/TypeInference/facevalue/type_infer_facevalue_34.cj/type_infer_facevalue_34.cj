// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo(x: Float64) :Float64 {
    return x + 1.0
}

func bar(x: Float64) :Float64 {
    return x + 1.0
}

class Data{
    var dt: Float64 = 1.0
    init(x: Float64, y: Int32){
        dt = x
    }
}

trait Num{
    func add(x: This, y: Int32): Float64
}

append Float64 with Num {
    func add(x: Float64, y: Int32): Float64{
        return x
    }
}

enum Test{ Do| Ho }

// 函数调用的结果再使用
func main(): Int64 {
    var i = foo(1.0)

    var int_1 = i
    var int_2 = i * 2.0
    // 条件操作符
    var int_3 = if(i < 2.0) {i} else {i+2.0}
    //函数入参/构造函数/trait入参/函数返回表达式/函数返回值
    var int_4 = foo(i)
    var int_5 = Data(i, 2).dt
    var int_6 = add(i, 3)

    // 函数最后一句表达式
    var int_7 = bar(i)
    // lambda表达式的入参/最后一句表达式
    var func_lambda = { x:Float64, y:Float64 =>  x+y }
    var int_8 = func_lambda(i, i)

    // if-else 表达式
    var int_10: Float64
    if (i > 1.0) {
        int_10 = i
    } else {
        int_10 = i+1.0
    }
    // match 表达式
    var int_11 = match (Test.Ho) {
        case $Do => i - 1.0
        case $Ho => i - 2.0
    }
    // block 表达式
    { var int_11 = 3}
    print("int_1: " + int_1.toString() + "\n")
    print("int_2: " +int_2.toString() + "\n")
    print("int_3: " +int_3.toString() + "\n")
    print("int_4: " +int_4.toString() + "\n")
    print("int_5: " +int_5.toString() + "\n")
    print("int_6: " +int_6.toString() + "\n")
    print("int_7: " +int_7.toString() + "\n")
    print("int_8: " +int_8.toString() + "\n")
    print("int_10: " +int_10.toString() + "\n")
    print("int_11: " +int_11.toString() + "\n")

    if (int_1 != 2.0) {
        return 1
    }
    if (int_2 != 4.0) {
        return 1
    }
    if (int_3 != 4.0) {
        return 1
    }
    if (int_4 != 3.0) {
        return 1
    }
    if (int_5 != 2.0) {
        return 1
    }
    if (int_6 != 2.0) {
        return 1
    }
    if (int_7 != 3.0) {
        return 1
    }
    if (int_8 != 4.0) {
        return 1
    }
    if (int_10 != 2.0) {
        return 1
    }
    if (int_11 != 0.0) {
        return 1
    }
    return 0
}
