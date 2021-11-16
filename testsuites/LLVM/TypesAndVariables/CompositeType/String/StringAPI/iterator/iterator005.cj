// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var iter1 = "仓颉".iterator()
var iter2 = "Cangjie".iterator()

func main():Int64 {
    var c1: Char = 'a'
    var c2: Char = 'b'
    for (i in iter1) {
        c1 = i
    }
    for (i in iter2) {
        c2 = i
    }

    if (c1 == '颉' && c2 == 'e') {
        return 0
    }
    return 1
}
