// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var s = "hello, world"
    var res = ""
    var utf8: Utf8View = s.utf8View
    for(u in utf8){
        res = res + "${u}"
    }
    for(u in utf8){
        res = res +  "${u}"
    }
    if ( res != "10410110810811144321191111141081001041011081081114432119111114108100") {
        return 1
    }
    return 0
}
