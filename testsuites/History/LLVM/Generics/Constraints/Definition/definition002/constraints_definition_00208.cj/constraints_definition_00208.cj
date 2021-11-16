// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait a{}
trait b{}
trait c{}
trait d{}
trait e{}
trait f{}
trait g{}
trait h{}
trait i{}
trait j{}
trait k{}
trait l{}
trait m{}
trait n{}
trait o{}
trait p{}
trait q{}
trait r{}
trait s{}
trait t{}
trait u{}
trait v{}
trait w{}
trait x{}
trait y{}
trait z{}


func test<T>() where T <: a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x&y&z{}

record R<T> where T <: a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x&y&z{}

enum E<T> where T <: a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x&y&z{e}

class C<T> where T <: a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x&y&z{}

interface I<T> where T <: a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x&y&z{}

append<T> R<T> with X where T<:a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x&y&z{} 


func main():Int64{
    return 0
}
