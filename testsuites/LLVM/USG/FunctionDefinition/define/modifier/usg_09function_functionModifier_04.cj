// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

// check the private modifier for the function in class
class A{
    private func a(){

    }
}
func main(): Int64{
    let a = A().a // EXPECTED: regex can not access function 'a'
    return 0
}