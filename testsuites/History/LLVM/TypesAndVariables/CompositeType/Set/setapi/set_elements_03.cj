// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    return 0
}

func case01(){
    let intSet1 = #{0, 1, 2}
    let intSet2 = #{3, 4, 5,6}
    let intSet3 = #{3, 4, 5,6}
    let intSet = #{intSet1, #{intSet2},intSet3} // EXPECTED: regex-auto inconsistent element type for Set literal
}

