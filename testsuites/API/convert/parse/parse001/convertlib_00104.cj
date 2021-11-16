// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseInt8(123)  // EXPECTED: regex cannot convert an integer literal to type 'Record-String'
    parseInt16('c')  // EXPECTED: regex cannot convert a character literal to type 'Record-String'
    parseInt32([1,2,3])  // EXPECTED: regex no matching function declaration for function call 'parseInt32'
    parseInt64(#{1,23,3})  // EXPECTED: regex no matching function declaration for function call 'parseInt64'
    parseUInt8(())  // EXPECTED: regex argument is mismatched with parameter type 'Record-String'
    parseUInt16((1,3,2))  // EXPECTED: regex argument is mismatched with parameter type 'Record-String'
    parseUInt32(a)  // EXPECTED: regex undeclared identifier 'a'
    parseUInt64(123)  // EXPECTED: regex  argument is mismatched with parameter type 'Record-String'
    parseFloat16(123)  // EXPECTED: regex  argument is mismatched with parameter type 'Record-String'
    parseFloat32(123)  // EXPECTED: regex  argument is mismatched with parameter type 'Record-String'
    parseFloat64(123)  // EXPECTED: regex  argument is mismatched with parameter type 'Record-String'
    return 0
}