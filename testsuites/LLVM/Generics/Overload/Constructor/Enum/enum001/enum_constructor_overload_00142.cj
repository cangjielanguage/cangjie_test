// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

class Base{}
class Sub{}

enum X{a((Base)->Unit,Base)}
enum Y{a((Sub)->Unit,Base)}
func g(a:Base):Unit{}
func g(a:Sub):Unit{}


func main():Int64{
    var j = a(g,Base()) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    return 1
}
