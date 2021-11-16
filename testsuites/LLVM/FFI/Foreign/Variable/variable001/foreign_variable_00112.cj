// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign func a(): Unit
foreign class b{}
foreign interface c{}

foreign {
func d(): Unit
class e{}
interface f{}
}

func a(){} // EXPECTED: regex function 'a' has overload conflicts
func d(){} // EXPECTED: regex function 'd' has overload conflicts
class b{} // EXPECTED: regex redefinition of declaration 'b'
class e{} // EXPECTED: regex redefinition of declaration 'e'
interface c{} // EXPECTED: regex redefinition of declaration 'c'
interface f{} // EXPECTED: regex redefinition of declaration 'f'
