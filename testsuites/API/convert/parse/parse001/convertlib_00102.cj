// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseInt8("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseInt16("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseInt32("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseInt64("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseUInt8("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseUInt16("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseUInt32("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseUInt64("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseFloat16("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseFloat32("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    parseFloat64("1","2")  // EXPECTED: regex extra argument given for call with parameter list
    return 0
}