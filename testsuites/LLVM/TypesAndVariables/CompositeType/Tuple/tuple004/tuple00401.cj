// EXEC-1: %compiler %cmp_opt %f -o %output
// Deprecated ?:
func foo_tuple(): Int64{
var tp1: Float32*Char = (3.14, 'P')
var tp2: Char*Char = ('3', 'P')
var res1 = true ? tp1 : ('3', 'P')
var res2 = false ? (3.14, 'P') : tp2
if (tp1._0 == 3.14 && tp2._0 == '3') {
return 0
}
return 1
}

func main():Int64{
return foo_tuple()
}
