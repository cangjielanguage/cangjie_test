// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    var num: Int64 = 0

    operator func [](index: Int64): Int64 {
        return this.num + index
    }

    operator func [](index: Int64, value: Int64): Unit {
        this.num = index + value
    }
}

func main(): Int64 {
    var a: A = A()
    print("${a[2]}\n") // invoke operator func [](x: A, index: Int64): Int64
    a[2] = 5           // invoke operator func [](x: A, index: Int64, value: Int64): Unit
    print("${a[1]}")
    return 0
}
