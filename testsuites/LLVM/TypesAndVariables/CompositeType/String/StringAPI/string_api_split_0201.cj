// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var s1 = "abcaef"
    var r1 = s1.split("")
    if ( !compare(r1,"abcaef") ){
        return 1
    }
    return 0

}

func compare(inpurt:Array<String>,res:String){
    var exp = ""
    for ( i in inpurt ){
        exp = exp + "${i}"
    }
    if ( exp != res ){
        return false
    }
    return true
}