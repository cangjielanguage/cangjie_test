// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Rectangle<T> {
    // 成员变量
    let width: T
    let length: T

    // 构造函数
    init (side: T) {
        this(side, side)
        print("123")
    }
    init (width: T, length: T) {
        this.width = width
        this.length = length
    }
}

func main(){
    var t = Rectangle<Int64>(4)
    print("${t.width}")   
    return 0
}

