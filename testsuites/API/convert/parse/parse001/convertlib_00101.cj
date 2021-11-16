// EXEC: %compiler %cmp_opt -backend-options="%stdx-package %link-convert" %f -o %n%suffix 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseInt8(/)  // EXPECTED: regex expected expression here
    parseInt16(/)  // EXPECTED: regex expected expression here
    parseInt32(/)  // EXPECTED: regex expected expression here
    parseInt64(/)  // EXPECTED: regex expected expression here
    parseUInt8(/)  // EXPECTED: regex expected expression here
    parseUInt16(/)  // EXPECTED: regex no matching function declaration for function call 'parseUInt16'
    parseUInt32(/)  // EXPECTED: regex no matching function declaration for function call 'parseUInt32'
    parseUInt64(/)  // EXPECTED: regex no matching function declaration for function call 'parseUInt64'
    parseFloat16(/)  // EXPECTED: regex no matching function declaration for function call 'parseFloat16'
    parseFloat32(/)  // EXPECTED: regex no matching function declaration for function call 'parseFloat32'
    parseFloat64(/)  // EXPECTED: regex expected expression here
}