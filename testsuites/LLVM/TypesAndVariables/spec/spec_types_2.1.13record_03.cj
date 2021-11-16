// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record R1 { // EXPECTED: regex value type recursive detected: 'R1->R1'
    let other: R1 
}
record R3 { 
    let other: R4 
}
record R4 { // EXPECTED: regex 'R4->R3->R4'
    let other: R3
}
func main(){
    return 0
}

