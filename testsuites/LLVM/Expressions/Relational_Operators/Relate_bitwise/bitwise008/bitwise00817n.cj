// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

// class/interface/record/enum 直接使用位操作符

class Data {}
interface I {}
record R {}
enum T { Some }

func main(): Int64 {
    !Data() ^ 1;   // EXPECTED: regex invalid unary operator '!' on type 'Class-Data'
    << R();        // EXPECTED: regex invalid expression initialization
    I >> T.Some;   // EXPECTED: regex expected member name or constructor call after 'I' type name
    Data() & I;    // EXPECTED: regex expected member name or constructor call after 'I' type name
    !I ^ 1 | R() << I;     // EXPECTED: regex expected member name or constructor call after 'I' type name
    T.Some >> 2 | R() << Data(); // EXPECTED: regex invalid binary operator '>>' on type 'Enum-T' and 'Int'
    return 0
}
