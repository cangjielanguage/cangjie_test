record Test {
    let a: Array<Int32>
    init(x: Array<Int32>) {
        a = x
    }
}

let res = Test({1,3})
let res1 = res.a

func run(): Int64 {
    if (res1[0] == 1 && res1[1] == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}