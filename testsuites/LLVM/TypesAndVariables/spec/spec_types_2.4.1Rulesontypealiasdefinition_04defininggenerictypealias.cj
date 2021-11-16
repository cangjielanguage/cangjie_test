// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class GenericClassA<T, V>{
}
class GenericClassB<T, V>{
}
class GenericClassC<T, V>{
}
class MyTrait{}
type Class1<V> where V <: MyTrait = GenericClassA<Int64, V>
type Class2<V> = GenericClassB<Int64, V> where V <: MyTrait 
type Class3<V> = GenericClassC<Int64, V>

func foo<V> (p: Class3<V>) where V <: MyTrait {
}

class ClassWithLongName<T> where T<:MyTrait {
}
type Class<T> = ClassWithLongName<T>

func main(){
    return 0
}

