// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Rectangle {
    private var length : Int32 = 0
    private var width : Int32 = 0
    // ERROR: 构造函数外不可通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    private var perimeter: Int32 = 2 * (this.length + this.width)  // EXPECTED: regex error.*?'this' is only allowed to be used inside constructor or function for record
    init(length: Int32, width: Int32) {
        this.length = length
        this.width = width
        this.perimeter = 2 * (this.length + this.width) // OK: 构造函数中可以通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }
    func getPerimeter() {
        return this.perimeter // Ok: 函数可通过 `this.memberName` 的方式访问名为 `memberName` 的非静态成员变量；
    }
}

func main(){
    var t: Rectangle = Rectangle(2,3)
    return 0
}

