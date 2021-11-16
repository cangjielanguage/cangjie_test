// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 位操作符应用于入参
func foo<V>(x:V):V{
    return x
}

func main(): Int64 {
    var x = foo<Int32>(!!!!10<<1)
    if (x == 20) {
        return 0
    }
    return 1
}