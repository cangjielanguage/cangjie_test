function isMoment(module) {
  return module.a1 + module.a2.a1 + module.a2.a2.toString() 
}

module.exports = function(module) {
    return isMoment(module)
}
