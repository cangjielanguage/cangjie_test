// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

class Base{}
class Sub{}

enum X{a((Base)->Unit,Sub)}
enum Y{a((Sub,Sub)->Unit,Base)}
func g(a:Base,b:Sub):Unit{}
func g(a:Sub,b:Base):Unit{}


func main():Int64{
    var j = a(g,Base()) // EXPECTED: regex no matching enum constructor 'a' for given arguments
    return 1
}
