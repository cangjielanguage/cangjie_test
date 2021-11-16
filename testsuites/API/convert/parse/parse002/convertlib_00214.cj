// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*


func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}


func main():Int64 {
    var str = "126"
    var a = parseInt8("50").Some(50)    // EXPECTED: regex base of member access can not be enum variable
    var b = parseInt16(str).Some(126)   // EXPECTED: regex base of member access can not be enum variable
    var c = parseInt32("32").None   // EXPECTED: regex base of member access can not be enum variable
    var d = parseInt64("64").None   // EXPECTED: regex base of member access can not be enum variable
    var e = parseUInt8("254").None  // EXPECTED: regex base of member access can not be enum variable
    var f = parseUInt16("16").Some(50)  // EXPECTED: regex base of member access can not be enum variable
    var g = parseUInt32("43").Some(50)  // EXPECTED: regex base of member access can not be enum variable
    var h = parseUInt64("64").Some(50)  // EXPECTED: regex base of member access can not be enum variable
    var i = parseFloat16("3.124_4646").None  // EXPECTED: regex base of member access can not be enum variable
    var j = parseFloat32(".3545464").None    // EXPECTED: regex base of member access can not be enum variable
    var k = parseFloat64("124.2214").None   // EXPECTED: regex base of member access can not be enum variable

    return 0
}