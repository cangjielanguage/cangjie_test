// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Rectangle {
    private let length : Int32
    private let width : Int32
    private let perimeter: Int32
    init() {  // EXPECTED: regex error.*?the uninitialized member variable 'perimeter' is not initialized in the constructor of class or record
              // ERROR: 构造函数没有显式调用其他构造函数，且perimeter没有被初始化
        this.length = 0
        this.width = 0
    }
    init(length: Int32, width: Int32) {     // OK: 构造函数中，所有的成员变量都得到了初始化
        this.length = length
        this.width = width
        this.perimeter = 2 * (this.length + this.width)
    }
    init(squareLength: Int32) {             // OK: 构造函数中调用了其他其他构造函数
        this(squareLength, squareLength)
    }
}

func main(){
    return 0
}

