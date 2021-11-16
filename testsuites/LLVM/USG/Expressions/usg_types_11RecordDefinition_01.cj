// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Rectangle1 {
    // 成员变量
    var width: Int32 = 10
    var length: Int32 = 20

    // 构造函数
    init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }

    // 成员函数
    func area(): Int32 { 
        return width * length 
    }
}

func main(){
    
    return 0
}

