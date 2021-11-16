// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

class Base{}
class Sub{}

enum X{a((Base)->Unit)}
enum Y{a((Sub)->Unit)}
func g(a:Base):Unit{}
func g(a:Sub):Unit{}


func main():Int64{
    var j = a(g) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    return 1
}
