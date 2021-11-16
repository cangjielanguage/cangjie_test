// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    var num: IntNative = 0

    operator func [](index: IntNative): IntNative {
        return this.num + index
    }

    operator func [](index: IntNative, value: IntNative): Unit {
        this.num = index + value
    }
}

func main(): IntNative {
    var a: A = A()
    print("${a[2]}\n") // invoke operator func [](x: A, index: IntNative): IntNative
    a[2] = 5           // invoke operator func [](x: A, index: IntNative, value: IntNative): Unit
    print("${a[1]}")
    return 0
}