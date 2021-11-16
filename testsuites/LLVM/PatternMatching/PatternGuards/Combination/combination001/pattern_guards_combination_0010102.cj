// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(){
    var i : Int64 = 1
    let j : Int64 = 1
    var a : Int64 = match (i) {
        case $j if (false){print("")} => i+1 // EXPECTED: regex error.*expected '=>' after pattern in case body
        case $j if (true) => i
        case _ => 0
    }
    return (a-1)
}
