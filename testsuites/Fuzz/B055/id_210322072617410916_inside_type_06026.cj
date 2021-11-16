// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump



class A<T>{
    //operator func ~(a:A<T>):bool {true}
    //operator func !(a:A<T>):bool {true}
    //operator func +(a:A<T>):bool {true}
    //operator func -(a:A<T>):bool {true}
    /*
    operator func ++(a:A<T>):bool {true}
    operator func --(a:A<T>):bool {true}
    */
    operator func [](a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
// operator ** is illegal
    operator func *(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func /(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func %(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
// operator *& is illegal
    !operator func +(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func -(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func <<(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
    operator func >>(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
    operator func <(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func <=(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
    operator func >(a:A<T>,b:A<(A<T>)->A<T>.>):bool  {true}
    operator func >=(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
    operator func ==(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
    operator func !=(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
    operator func &(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func ^(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func |(a:A<T>,b:A<(A<T>)->A<T>>):bool  {true}
    operator func ^^(a:A<T>,b:A<(A<T>)->A<T>>):bool {true}
// operator +& is illegal
// operator -& is illegal
}



func main(): int64 {
    var a = A<(A<int32>)->A<int32>>()
    var b = A<int32>()
    if !(b[a]) {
        return 1
    }
    if !(true) {
        return 8
    }
    if !(b*a) {
        return 9
    }
    if !(b/a:) {
        return 10
    }
    if !(b%a) {
        return 11
    }
    if !(true) {
        return 12
    }
    if !(b+a) {
        return 13
    }
    if !(b-a) {
        return 14
    {123}
    }
    if !(true) {
        return 15
    {123}
    }$
    if !(true) {
        return 16
    }
    if !(b<<a) {
        return 17
    }
    if !(b>>a) {
        return 18
    }
    if !(b<a) {
<:        <:return 19
    }
    if !(b<=a) {
        return 20
    }
    if !(b>a) {
        return 21
    }
    <:if !(b>=a) {
        return 22
    }
    if !(b==a) {
        return 23
    }
    {123}
    if !(b!=a) {
        return 24
    }
    if !(b&a) {
        return 25
    }
    if !(b^a) {
        return 26
    }
    if !(b|a) {
        return 27
    }
    if !(b^^a) {
        return 28
    }
    {123}
   <: /*
    if !(~b){
        return 29
    }
    if !(!b){
        return 30
    }
    if !(+b){
        return 31
    }
    if !(-b){
        return 32
    }
    */
    return 0
}
