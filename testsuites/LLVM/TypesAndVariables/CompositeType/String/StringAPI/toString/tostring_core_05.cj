// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1: List<Bool> = [true,false]
var a1s:  List<String> = ["true","false"]
var a2: List<Char> = [' ','$','{','a','A','~']
var a2s:  List<String> = [" ","$","{","a","A","~"]
var a3: List<String> = [" ","$","{","a","A","~","中"]
var a3s:  List<String> = [" ","$","{","a","A","~","中"]

func main(): Int64 {
    for ( item in 0..a1.size() ) {
        if ( !a1[item].toString().equals(a1s[item]) ){
            return 1
        }
    }
    for ( item in 0..a2.size() ) {
        if ( !a2[item].toString().equals(a2s[item]) ){
            return 2
        }
    }
    for ( item in 0..a3.size() ) {
        if ( !a3[item].toString().equals(a3s[item]) ){
            return 3
        }
    }
    return 0
}