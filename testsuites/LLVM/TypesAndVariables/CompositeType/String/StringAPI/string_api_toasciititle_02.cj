// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS2021091415811
func main(): Int64 {
    var r1 = "abc,abc!abc1abc abc$abc中abc".toAsciiTitle()
    if ( r1 != "Abc,Abc!Abc1Abc Abc$Abc中Abc" ){
        return 6
    }



    return 0
}