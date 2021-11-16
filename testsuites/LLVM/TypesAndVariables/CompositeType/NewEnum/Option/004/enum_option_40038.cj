// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'func' can not be assigned
class C {
    func test(){1}
}

func main(): Int64 {
    let c1 : ?C = C()
    c1?.test = {=>10}
    let r1 = c1?.test
    let res = r1 ?? {=>100}
    return res() - 10
}
