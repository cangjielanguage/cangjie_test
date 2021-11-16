// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT:scan at least one case expression in match case body

func main(){
    var i : Int64 = 1
    var flag : Bool = true
    var a : Int64 = match (i) {
        if (flag) case _ => i
    }
    return (a-1)
}
