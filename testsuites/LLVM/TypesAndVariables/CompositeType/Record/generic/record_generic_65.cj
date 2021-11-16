// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

record Data<T1> {
    func getX(x: T1): T1 {
        return x
    }
}

func main() {
    var i: Int32 = 4
    let x: Int64 = Data<Int32>().getX(i) // EXPECTED: regex return type for 'getX' is mismatched
    return 0
}
