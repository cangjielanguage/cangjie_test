// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C {
    var item: Int64 = 100
}

func main(): Int64 {
    let c1 : ?C = C()
    let r1 = c1?.item<Bool> // EXPECTED: regex type argument's number does not match type parameter's number
    let res = r1 ?? 0
    return res - 100
}
