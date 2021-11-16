// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Rectangle {
    private var length : Int32 = 0
    private var width : Int32 = 0
    private var perimeter: Int32 = 0
    init(squareLength: Int32) {
        this.length = squareLength
        this.width = squareLength
        this.perimeter = getPerimeter(squareLength, squareLength)  // EXPECTED: regex error.*?non static member function 'getPerimeter' cannot be accessed before finishing initialization of the record
   // ERROR: 构造函数中未调用其他构造函数，不允许调用其他非静态成员函数
    }
    init(length: Int32, width: Int32) {
        this(1)                                                      // 调用其他构造函数
        this.length = length
        this.width = width
        this.perimeter = getPerimeter(length, width)                // OK: 构造函数中先调用了其他构造函数，可以通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }
    func getPerimeter(length: Int32, width: Int32): Int32 {
        return 2 * (width + length)
    }
}
func main(){
    return 0
}

