// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class A<T>{
    operator func !():String {return "a"}
    operator func -():String <T>):String {return "a"}
    operator func <(b:A<T>):String  {return "a"}
    operator func <=(b:A<T>):String {return "a"}
    operator fu{return "a"}

    operator func [](b:A<T>):String {return "a"}

    operator func *(b:A<T>):String  {return "a"}
    operator func /(b:A<T>):String  {return "a"}
    operator func %(b:A<T>):String  {return "a"}

    operator func +(b:A<T>):String  {return "a"}
    operator func -(b:A<T>):String  {return "a"}
    operator func <<(b:A<T>):String {return "a"}
    operator func >>(b:A<T>):String {return "a"}
    operator func <(b:A<T>):String  {return "a"}
    operator func <=(b:A<T>):String {return "a"}
    operator func >(b:A<T>):String  {return "a"}
    operator func >=(b:A<T>):String {return "a"}
    operator func ==(b:A<T>):String {return "a"}
    operator func !=(b:A<T>):String {return "a"}
    operator func &(b:A<T>):String  {return "a"}
    operator func ^(b:A<T>):String  {return "a"}
    operator func |(b:A<T>):String  {return "a"}

}

func main(): Int64 {
    var a : A<String> = A<String>()
    var b : A<String> = A<String>()
    var result : (String)[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}