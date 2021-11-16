package enum_generic_invoke_05

enum TimeUnit<T> {
    Year(T) | Month(T)
}