// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

// Brief:声明变量类型为Unit，matchcase后为声明

var a:Unit = match (1){
    case x => var a = 1
}
func main():Int64 {
    if ( a != () ){
        return 1
    }
    return 0
}
