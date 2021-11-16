// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main() : Int64 {
    var a = HashMap<Int64,String>([(1,"Aa"),(2, "Bb")])

    if ( !(a == 'a')){
        return 1
    }
    if ( a == 'b' ){
        return 2
    }
    return 0
}

extend HashMap<K , V> where K <: Hashable, K <: Equatable<K> {
    operator func ==(right:Char):Bool  {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}