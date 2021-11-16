// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func a():Unit

foreign {
    func b():Unit
}

var x = a
var y = b