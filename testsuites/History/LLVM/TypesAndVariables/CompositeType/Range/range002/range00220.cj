// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
    let r = Int64(0)...10
}

func main(): Int64 {
    var c = I.r
    var a = @{0,1,2,3,4,5,6,7,8,9}
    var res = 0
    for i in a[c]{
        res = res + i
    }
    if res == 45{
        return 0
    }
    return 1
}
