// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex note.* to match this '\('

func main() {
    var i = (3, 5)
    match (i) { case a@ (_, _] => } // EXPECTED: regex error.* expected '\)'
    return 0
}
