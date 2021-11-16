// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{e(List<Int64>)|e}

func main(): Int64 {
    var i = [1,1]
    var a : E = e([1,1])
    match (a){
        case e(in $i) => 0 // EXPECTED: regex 'in pattern' can not be nested in other pattern now.
        case $e => 1
    }
}
