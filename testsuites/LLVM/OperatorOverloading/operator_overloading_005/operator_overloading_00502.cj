// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface update {
    operator func [](b:This):This
    operator func !():This
//    operator func +(a:This):This
    operator func -():This
    operator func **(b:This):This
    operator func *(b:This):This
    operator func /(b:This):This
    operator func %(b:This):This
    operator func +(b:This):This
    operator func -(b:This):This
    operator func <<(b:This):This
    operator func >>(b:This):This
    operator func <(b:This):This
    operator func <=(b:This):This
    operator func >(b:This):This
    operator func >=(b:This):This
    operator func ==(b:This):This
    operator func !=(b:This):This
    operator func &(b:This):This
    operator func ^(b:This):This
    operator func |(b:This):This
//     operator func ^^(b:This):This

}

extend UInt32 <: update {
    operator func [](b:UInt32):UInt32  {1}
    operator func !():UInt32   {5} // EXPECTED: regex-auto operator func !() of type UInt32 is a built-in function and cannot be overridden
//    operator func +(a:UInt32):UInt32   {6}
    operator func -():UInt32   {7} // EXPECTED: regex-auto operator func -() of type UInt32 is a built-in function and cannot be overridden
    operator func **(b:UInt32):UInt32  {8} // EXPECTED: regex-auto operator func **(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func *(b:UInt32):UInt32   {9} // EXPECTED: regex-auto operator func *(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func /(b:UInt32):UInt32   {10} // EXPECTED: regex-auto operator func /(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func %(b:UInt32):UInt32   {11} // EXPECTED: regex-auto operator func %(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func +(b:UInt32):UInt32   {13} // EXPECTED: regex-auto operator func +(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func -(b:UInt32):UInt32   {14} // EXPECTED: regex-auto operator func -(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func <<(b:UInt32):UInt32  {17} // EXPECTED: regex-auto operator func <<(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func >>(b:UInt32):UInt32  {18} // EXPECTED: regex-auto operator func >>(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func <(b:UInt32):UInt32   {19} // EXPECTED: regex-auto operator func <(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func <=(b:UInt32):UInt32  {20} // EXPECTED: regex-auto operator func <=(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func >(b:UInt32):UInt32   {21} // EXPECTED: regex-auto operator func >(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func >=(b:UInt32):UInt32  {22} // EXPECTED: regex-auto operator func >=(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func ==(b:UInt32):UInt32  {23} // EXPECTED: regex-auto operator func ==(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func !=(b:UInt32):UInt32  {24} // EXPECTED: regex-auto operator func !=(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func &(b:UInt32):UInt32   {25} // EXPECTED: regex-auto operator func &(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func ^(b:UInt32):UInt32   {26} // EXPECTED: regex-auto operator func ^(UInt32) of type UInt32 is a built-in function and cannot be overridden
    operator func |(b:UInt32):UInt32   {27} // EXPECTED: regex-auto operator func |(UInt32) of type UInt32 is a built-in function and cannot be overridden
//     operator func ^^(b:UInt32):UInt32  {28}

}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
