// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    var rs = Array<Int64>(4, {i => 0})
    rs[0] = 1732584193 // rs[0]=1732584193
    var a:Int64 = rs[0] // a =rs[0]= 1732584193
    let a1 = rs[0] + a // a1 = 3465168386
    rs[0] += a // rs[0]= 3465168386 a = 3465168386
    if ( rs[0] != 3465168386 || a1 != 3465168386 || a != 1732584193 ){
        return 1
    } 
    return 0
}
