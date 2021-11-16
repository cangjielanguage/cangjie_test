// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseInt8("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseInt16("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseInt32("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseInt64("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseUInt8("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseUInt16("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseUInt32("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseUInt64("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseFloat16("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseFloat32("\")  // EXPECTED: regex string literal is missing '\"' in the end
    parseFloat64("\")  // EXPECTED: regex string literal is missing '\"' in the end
    return 0
}