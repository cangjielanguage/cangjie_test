// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Rectangle {
    private var length : Int32 = 0
    private var width : Int32 = 0
    private var perimeter: Int32 = 0
    init() {}
    init(length: Int32, width: Int32) {
        this()                                                      // 调用其他构造函数
        this.length = length
        this.width = width
        this.perimeter = getPerimeter(length, width)                // OK: 构造函数中先调用了其他构造函数，可以通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }
    func getPerimeter(length: Int32, width: Int32): Int32 {
        return 2 * (width + length)
    }
}
func main(){
    var t: Rectangle = Rectangle(3,4)
    var k = t.getPerimeter(1,2)
    print("${k}\n")
    return 0
}

