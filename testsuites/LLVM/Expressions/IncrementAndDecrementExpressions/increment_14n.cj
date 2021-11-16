// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// 自增减不支持非数值类型
func main(): Int64 {
    var a1 =  'a'
    a1++ // EXPECTED: regex 'Char' is unsupported for this increment or decrement expression
    var a2 = "a"
    a2++ // EXPECTED: regex 'Record-String' is unsupported for this increment or decrement expression
    var a3 = true
    a3++ // EXPECTED: regex 'Bool' is unsupported for this increment or decrement expression
    var a4 = ()
    a4++ // EXPECTED: regex 'Unit' is unsupported for this increment or decrement expression
    //var a5 =  // TBD:bottom
    var a6 :List<Int32> = [1]
    a6++ // EXPECTED: regex 'Class-List<Int32>' is unsupported for this increment or decrement expression
    var a9 = (3.14, "PIE")
    a9[0]++ // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    var a:Int32 = 1;var b:Int32 = 1
    var a10 = (a+b, a-b)
    a10[0]++ // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    var a11 = ((2, 3), 4)
    a11[0]++ // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    var a12 = 0..10:1
    a12++ // EXPECTED: regex 'Class-Range<Int64>' is unsupported for this increment or decrement expression

    return 0;
}

