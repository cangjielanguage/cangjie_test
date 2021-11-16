// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<X>{
operator func !(a:A<X>):Bool{return false}
}

interface B <: A{}
class C_B <: B{
func foo():Int32{1}
}

interface C<X> <: A<Int32>{}
class C_C <: C<Int32>{
func foo():Int32{2}
}

interface D<X> <: A<X>{}
class C_D <: D<Int32>{
func foo():Int32{3}
}

interface E<X,Y> <: A<X>{}
class C_E <: E<Int32,Int32>{
func foo():Int32{4}
}


func main(){
return 0
}
