// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class A {
    var a : Int64 = 1
    var b : Int64

    init() {}  // EXPECTED: regex error.*?the uninitialized member variable 'b' is not initialized in the constructor of class or record
    init(b: Int64) {    // OK: 全部成员变量均被初始化
        this.b = b
    }
}

func main(){

    return 0
}

