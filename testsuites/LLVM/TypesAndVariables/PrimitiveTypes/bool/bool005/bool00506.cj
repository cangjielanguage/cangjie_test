// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    //三段表达式
    if ((if(t){33} else {777}) != 33) {
        return 1
    }
    if ((if(f){33} else {777}) != 777) {
        return 1
    }
    return 0
}
