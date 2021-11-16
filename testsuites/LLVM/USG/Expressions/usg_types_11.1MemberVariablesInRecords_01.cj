// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Rectangle {
    public var length : Int32           // 未初始化的非静态成员变量定义
    private var width : Int32 = 0       // 初始化的非静态成员变量定义
    var diagonalLength: Int32 = 0
    static var name : String = "Rec"    // 静态成员变量

    // ERROR: 静态成员变量的初值表达式中不能调用非静态成员。
    static var perimeter: Int32 = 2 * (this.length + this.width)  // EXPECTED: regex error.*?'this' is only allowed to be used inside constructor or function for record

    // ERROR: 静态成员变量定义未提供初始值
    static var area: Int32  // EXPECTED: regex error.*?static variable 'area' needs to be initialized when declaring

    // ERROR: 成员变量 `length` 未被初始化 
    init() {}  // EXPECTED: regex error.*?the uninitialized member variable 'length' is not initialized in the constructor of class or record

    init(length: Int32) {           // OK: 成员变量 `length` 完成初始化
        this.length = length            
    }
}

func checkRectangle() {
    var rect: Rectangle = Rectangle(3)
    print("${rect.length}")         // OK: 访问控制符为 public，可以在record外访问

    // ERROR: 访问控制符为 private，不可以在record外访问
    print("${rect.width}")  // EXPECTED: regex error.*?can not access field 'width'

    print("${rect.diagonalLength}") // OK: 访问控制符缺省时为 public，可以在record外访问
    print(Rectangle.name)      // OK: 静态变量通过 record 名字访问

    // ERROR: 静态变量不能通过 record实例访问，要通过record名字访
    print(rect.name)  // EXPECTED: regex error.*?object cannot access static member 'name'

    // ERROR: 非静态变量不能通过record名字访问，要通过record实例访问
    print("${Rectangle.diagonalLength}")  // EXPECTED: regex error.*?'diagonalLength' is non-static member, cannot access by type name
}

func main(){
    checkRectangle()
    return 0
}

