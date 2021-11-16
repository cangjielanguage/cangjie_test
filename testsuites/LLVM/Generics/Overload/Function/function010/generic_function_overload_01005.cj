// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:regex-not core dumped


func f<X>(a: X, b:Option<X> = Option<X>.None): Int64 {0} //f1
func f<X>(a: X): Int64 {1} //f2


func main(){
    f(1) // EXPECTED: regex ambiguous match for function call
    1
}