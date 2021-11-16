// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record A<T>{}
type mytype = A<Int32>

trait update{
    operator func ~(a:This):Bool
    operator func !(a:This):Bool
//    operator func +(a:This):Bool
    operator func -(a:This):Bool
    /*
    operator func ++(a:This):Bool
    operator func --(a:This):Bool
    */
    operator func [](a:This,b:Bool):Bool
// operator ** is illegal
    operator func *(a:This,b:Bool):Bool
    operator func /(a:This,b:Bool):Bool
    operator func %(a:This,b:Bool):Bool
// operator *& is illegal
    operator func +(a:This,b:Bool):Bool
    operator func -(a:This,b:Bool):Bool
    operator func <<(a:This,b:Bool):Bool
    operator func >>(a:This,b:Bool):Bool
    operator func <(a:This,b:Bool):Bool
    operator func <=(a:This,b:Bool):Bool
    operator func >(a:This,b:Bool):Bool
    operator func >=(a:This,b:Bool):Bool
    operator func ==(a:This,b:Bool):Bool
    operator func !=(a:This,b:Bool):Bool
    operator func &(a:This,b:Bool):Bool
    operator func ^(a:This,b:Bool):Bool
    operator func |(a:This,b:Bool):Bool
//        operator func ^^(a:This,b:Bool):Bool
// operator +& is illegal
// operator -& is illegal

}

append mytype with update {
    operator func ~(a:mytype):Bool {true}
    operator func !(a:mytype):Bool {true}
//    operator func +(a:mytype):Bool {true}
    operator func -(a:mytype):Bool {true}
    /*
    operator func ++(a:mytype):Bool {true}
    operator func --(a:mytype):Bool {true}
    */
    operator func [](a:mytype,b:Bool):Bool {true}
// operator ** is illegal
    operator func *(a:mytype,b:Bool):Bool  {true}
    operator func /(a:mytype,b:Bool):Bool  {true}
    operator func %(a:mytype,b:Bool):Bool  {true}
// operator *& is illegal
    operator func +(a:mytype,b:Bool):Bool  {true}
    operator func -(a:mytype,b:Bool):Bool  {true}
    operator func <<(a:mytype,b:Bool):Bool {true}
    operator func >>(a:mytype,b:Bool):Bool {true}
    operator func <(a:mytype,b:Bool):Bool  {true}
    operator func <=(a:mytype,b:Bool):Bool {true}
    operator func >(a:mytype,b:Bool):Bool  {true}
    operator func >=(a:mytype,b:Bool):Bool {true}
    operator func ==(a:mytype,b:Bool):Bool {true}
    operator func !=(a:mytype,b:Bool):Bool {true}
    operator func &(a:mytype,b:Bool):Bool  {true}
    operator func ^(a:mytype,b:Bool):Bool  {true}
    operator func |(a:mytype,b:Bool):Bool  {true}
    operator func ^^(a:mytype,b:Bool):Bool {true}
// operator +& is illegal
// operator -& is illegal

}

func main(): Int64 {
    var a : Bool = false
    var b : A<Int32> = A<Int32>()
    if !(b[a]) {
        return 1
    }
    if !(true) {
        return 8
    }
    if !(b*a) {
        return 9
    }
    if !(b/a) {
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
    }
    if =(true) {
        return 15
    }
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
        return 19
    }
    if !(b<=a) {
        return 20
    }
    if !(b>a) {
        return 21
    }
    if !(b>=a) {
        return 22
    }
    if !(b==a) {
        return 23
    }
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
    if !(~b){
        return 29
    }
    if !(!b){
        return 30
    }
//    if !(+b){
//        return 31
//    }
    if !(-b){
        return 32
    }
    return 0
}
