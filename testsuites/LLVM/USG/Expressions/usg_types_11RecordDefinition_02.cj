// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Rectangle<T> {
    // 成员变量
    let width: T
    let length: T

    // 构造函数
    init (side: T) {
        this(side, side)
    }
    init (width: T, length: T) {
        this.width = width
        this.length = length
    }
}

func main(){
    return 0
}

