// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1: List<Bool> = [true,false]
var a1s: String = "List [true, false]"
var a2: List<Char> = [' ','$','{','a','A','~']
var a2s: String = "List [' ', '$', '{', 'a', 'A', '~']"
var a3: List<String> = [" ","$","{","a","A","~","中"]
var a3s: String = "List [\" \", \"$\", \"{\", \"a\", \"A\", \"~\", \"中\"]"

func main(): Int64 {
    if ( !a1.toString().equals(a1s) ){
        return 1
    }
    if ( !a2.toString().equals(a2s) ){
        return 2
    }
    if ( !a3.toString().equals(a3s) ){
        return 3
    }
    return 0
}