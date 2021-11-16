// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let a : ()->Int64 = {  => return return}

func main(): Int64 {
let b : ()->Int64 = {  => return return}
return a() + b()
}
