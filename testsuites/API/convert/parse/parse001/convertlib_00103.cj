// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseInt8()  // EXPECTED: regex missing argument for call with parameter list
    parseInt16()  // EXPECTED: regex missing argument for call with parameter list
    parseInt32()  // EXPECTED: regex missing argument for call with parameter list
    parseInt64()  // EXPECTED: regex missing argument for call with parameter list
    parseUInt8()  // EXPECTED: regex missing argument for call with parameter list
    parseUInt16()  // EXPECTED: regex missing argument for call with parameter list
    parseUInt32()  // EXPECTED: regex missing argument for call with parameter list
    parseUInt64()  // EXPECTED: regex missing argument for call with parameter list
    parseFloat16()  // EXPECTED: regex missing argument for call with parameter list
    parseFloat32()  // EXPECTED: regex missing argument for call with parameter list
    parseFloat64()  // EXPECTED: regex missing argument for call with parameter list
    return 0
}