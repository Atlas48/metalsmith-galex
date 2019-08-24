/*
function nc (x, y)
  if typeof x isnt 'undefined' then x
  else y
*/

function bool-string (s)
  switch s
    | \False, \false => false
    | \True, \true   => true

function pick (array, object)
  {[key,value] for key,value of object when (array.includes key) or object.has-own-property key}

export bool-string, pick
