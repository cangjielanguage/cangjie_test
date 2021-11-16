// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f


func foo<T>(){}

func main() {
    let a = #{1:1,2:2,3:3}
    var tup = (1,1)
    var b = 1
    match (b) {
        case in $a => "success" // EXPECTED: regex-auto unsupported type 'Map' for 'in pattern' in match case.
        case _ => "FAILED"
    }
    return 0
}
