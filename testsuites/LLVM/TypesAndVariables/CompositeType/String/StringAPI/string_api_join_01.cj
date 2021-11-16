// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var as1 :Array<String> = Array<String>(["hello","仓颉"])
    var as2 :Array<String> = Array<String>(["",""])
    var as3 :Array<String> = Array<String>([])
    var as4 :Array<String> = Array<String>([""])
    var as5 :Array<String> = Array<String>(["a"])
    var r1 = String.join(as1,delimiter:"|")
    var r2 = String.join(as1)
    var r3 = String.join(as2,delimiter:"|")
    var r4 = String.join(as3,delimiter:"|")
    var r5 = String.join(as4,delimiter:"|")
    var r6 = String.join(as5,delimiter:"|")

    if ( r1 != "hello|仓颉" ){
        return 1
    }
    if ( r2 != "hello仓颉" ){
        return 2
    }
    if ( r3 != "|" ){
        return 3
    }
    if ( r4 != "" ){
        return 4
    }
    if ( r5 != "" ){
        return 5
    }
    if ( r6 != "a" ){
        return 6
    }
    return 0
}

