// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

@JavaScript
foreign func a():Unit

@JavaScript
foreign {
func b():Unit
}
