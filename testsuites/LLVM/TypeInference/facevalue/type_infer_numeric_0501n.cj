// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data {
    var data: Int8
    init(x: Int8) {
        data = x
    }
}

func foo1(x: Int8): Int32 {
    return 2.0 // EXPECTED: regex type of return expression is incompatible with return type
}

func foo2(x: Int8): Int32 {
    return 3
}

extend Int32 {
    func add(x: Int32, y: Int32): Int64 {
        return 3
    }
}

extend Int64 {
    func add(x: Int64, y: Int32): Int64 {
        return x
    }
}

func main():Int64{
    var str = "hello world"
    var num1: Int8 = 2.0 // EXPECTED: regex initializer's type is incompatible with variable declaration 'num1'
    var res1 = str.charAt(3.0) // EXPECTED: regex cannot convert a floating-point literal to type 'Int64'
    var res2 = Data(2.0).data // EXPECTED: regex no matching constructor for call
    var res3 = foo(2.0) // EXPECTED: regex undeclared identifier 'foo'
    var num2: Int64 = 2
    var res4 = add(num2, 3.0) // EXPECTED: regex undeclared identifier 'add'

    return 0
}
