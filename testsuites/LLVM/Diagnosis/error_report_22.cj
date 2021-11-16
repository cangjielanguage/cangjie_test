// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data{
    var data: Int64
    init(x: Int64){ // EXPECTED: regex note.*found candidate
        data = 1
    }
    func foo(x:Int64) { // EXPECTED: regex note.*found candidate
        return 0
    }
    static func bar(x: Int64) {0} // EXPECTED: regex note.*found candidate
    operator func +(right: Int64):Int64 {
        return this.data + right
    }
}

func main():Int64 {
    Data(1,2)
    Data(2).foo(12,3)
    Data().foo(3,4)
    Data.bar(4,5)
    Data(1) + 6 +7
    return 0
}
