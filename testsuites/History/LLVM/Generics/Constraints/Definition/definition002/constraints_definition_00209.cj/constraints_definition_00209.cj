// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}
trait B{}


func test<T>()
where
T
<:
A
&
B
{}

record R<T>
where
T
<:
A
&
B
{}

enum E<T> where
T
<:
A
&
B
{e}

class C<T>
where
T
<:
A
&
B
{}

interface I<T>
where
T
<:
A
&
B
{}

append<T> R<T> with X
where
T
<:
A
&
B
{}


func main():Int64{
    return 0
}
