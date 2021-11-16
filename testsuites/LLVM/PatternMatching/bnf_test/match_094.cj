// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "jack"
    let N = 10
    let M = "bom"
    match (i) { case true | $ $N | $ _$M => case false | $$M | $ \$N => } // EXPECTED: regex expected constant literal here
    return 0
}
