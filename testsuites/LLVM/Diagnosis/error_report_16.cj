// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

record Data{
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
    Data()
    Data(2).foo()
    Data().foo()
    Data.bar()

    Data(1) + 6
    return 0
}
