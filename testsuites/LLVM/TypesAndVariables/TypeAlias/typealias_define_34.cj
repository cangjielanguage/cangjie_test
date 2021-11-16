// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class ClassData<T> {
    var i: T
    init(n: T) { this.i = n }
    func test(j: T): T {
        i = j
        return i
    }
}

type CD<T> = ClassData<T>

func main(): Int64 {
    var cd1: CD<String> = ClassData<String>("")
    let v1: String = cd1.test("hello")
    var cd2: CD<UInt16> = ClassData<UInt16>(0)
    let i: UInt16 = 1
    let v2: UInt16 = cd2.test(i)
    let res: String = v1 + v2.toString()
    if (res == "hello1") {
        return 0
    }
    return 1
}