// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(){
    var i : Int64 = 1
    let j : Int64 = 1
    var a : Int64 = match (i) {
        case $j if (1) => i+1 // EXPECTED: regex error.*cannot convert an integer literal to type 'Bool'
        case $j if (true) => i
        case _ => 0
    }
    return (a-1)
}
