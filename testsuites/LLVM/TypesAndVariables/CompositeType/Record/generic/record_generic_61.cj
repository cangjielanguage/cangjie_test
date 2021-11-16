// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

record Data<T1> {
    let a: T1
    init(x: T1) {
        a = x
    }
}

func main() {
    let data: Data = Data<Int32>(3)  // EXPECTED: regex generic type should be used with type argument
    return 0
}
