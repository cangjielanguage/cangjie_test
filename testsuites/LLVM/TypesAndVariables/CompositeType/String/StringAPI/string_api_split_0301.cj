// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var s1 = "abcaef"
    var s2 = ""
    var s3 = "中国中心"
    var r1 = s1.split("a",-2)
    var r2 = s1.split('a',-1)
    var r3 = s3.split("中",-3)
    var r4 = s2.split("a",-3)
    var r5 = s1.split("bae",-1)
    if ( !compare(r1,"||bc|ef") ){
        return 1
    }
    if ( !compare(r2,"||bc|ef") ){
        return 2
    }
    if ( !compare(r3,"||国|心") ){
        return 3
    }
    if ( !compare(r4,"") ){
        return 4
    }
    if ( !compare(r5,"|abcaef") ){
        return 8
    }
    return 0

}

func compare(inpurt:Array<String>,res:String){
    var exp = ""
    var split = "|"
    for ( i in inpurt ){
        exp = exp + "|" + "${i}"
    }
    if ( exp != res ){
        return false
    }
    return true
}
