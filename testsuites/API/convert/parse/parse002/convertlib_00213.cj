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
    var str = "123"
    var a = parseInt8("1").Other    // EXPECTED: regex 'Other' is not a member of enum 'Option'
    var b = parseInt16(str).Other   // EXPECTED: regex 'Other' is not a member of enum 'Option'
    var c = parseInt32("32").Other  // EXPECTED: regex 'Other' is not a member of enum 'Option'
    var d = parseInt64("64").Other  // EXPECTED: regex 'Other' is not a member of enum 'Option'
    var e = parseUInt8("8").Day // EXPECTED: regex 'Day' is not a member of enum 'Option'
    var f = parseUInt16("16").Hour  // EXPECTED: regex 'Hour' is not a member of enum 'Option'
    var g = parseUInt32("132").Other    // EXPECTED: regex 'Other' is not a member of enum 'Option'
    var h = parseUInt64("164").None(1)  // EXPECTED: regex calling object is not a function or constructors
    var i = parseFloat16("0.16").None
    var j = parseFloat32("3.64").None
    var k = parseFloat64("3.32").None

    return 0
}