// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Rectangle {
    private var length : Int32 = 0
    private var width : Int32 = 0
    private init() {}
    public init(squareLength: Int32) {
        this()               // 正确：private修饰的init构造函数可在record内访问
        this.length = squareLength
        this.width = squareLength
    }
    init(length: Int32, width: Int32) {
        this.length = length
        this.width = width
    }
}

func generateRectangele() {
    var rectangle2 = Rectangle(5)    // OK: public修饰的init构造函数可在record外访问
    var rectangle1 = Rectangle(3, 4) // OK: 缺省时为public，无`public` 或 `private` 修饰的init构造函数可在record外访问
    // ERROR: private修饰的init构造函数不可在record外访问
    var rectangle3 = Rectangle()  // EXPECTED: regex error.*?no matching constructor for call 'Rectangle'

}

func main(){
    generateRectangele()
    return 0
}

