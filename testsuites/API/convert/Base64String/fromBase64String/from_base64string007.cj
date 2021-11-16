// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*


func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}

func getLongString(): String{
    var base64String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    var str: String = ""
    var loop = 0
    while (loop < 10){
        str = str + base64String
        loop = loop + 1
    }
    str
}


func main():Int64 {
    var str = getLongString()
    var opt = fromBase64String(str)
    var res = matchResult<Array<UInt8>>(opt, Array<UInt8>())
    if (res.size()== 480 && res[res.size()-1] == 191) {
        return 0
    }
    return 1
}