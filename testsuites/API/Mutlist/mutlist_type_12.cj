// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

let op = Option<Char>.Some('m')
var r1 = Buffer<Option<Char>>([op])
var r2 = Buffer<Option<Char>>([Option<Char>.Some('m')])

func case01(x:Option<Char>){
    return match (x){
        case Some(z) => z
        case None =>'c'
    }
}

func main(): Int64 {
    if ( r1.size() != 1 ){
        return 1
    }
    if ( r2.size() != 1 ){
        return 2
    }
    if ( case01(r1[0]) != 'm')
    {
        return 3
    }
    if ( case01(r2[0]) != 'm')
    {
        return 4
    }
    return 0
}
