// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit4 {
    | Year
    | Year(Int32)  // EXPECTED: regex 'Year' is already exist in enum 'TimeUnit4'
    | Year(Float32)  
    | Month(Int32, Float32)  // EXPECTED: regex 'Month' is already exist in enum 'TimeUnit4'
    | Month(Int32, Int32)
    | Month(Int32) 
    | Day(Int32, Float32, Float32)  // EXPECTED: regex  'Day' is already exist in enum 'TimeUnit4'
    | Day(Float32, Float32, Float32)
    | Day(Float32, Float32) 
    | Hour(Int32, Float32, Float32, Float32)  // EXPECTED: regex 'Hour' is already exist in enum 'TimeUnit4'
    | Hour(Int32, Int32, Int32, Int32)
    | Hour(Int32, Int32, Int32)
}


func main(){

    return 0
}

