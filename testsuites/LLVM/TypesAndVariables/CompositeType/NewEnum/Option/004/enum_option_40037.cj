//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var item: List<Int64> = [100]

func main(): Int64 {
    let c1 : ?List<Int64> = item 
    let x = Some(10)
    c1?[0] = 10 // EXPECTED:regex error.*? type Class-List<Int64> does not have operator func
    let r1 = c1?[0]
    let res = r1 ?? 0
    return res - 10
}
