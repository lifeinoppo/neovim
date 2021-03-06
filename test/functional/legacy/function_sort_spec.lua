local helpers = require('test.functional.helpers')
local clear = helpers.clear
local eq = helpers.eq
local eval = helpers.eval

describe('sort', function()
  before_each(clear)

  it('numbers compared as strings', function()
    eq({1, 2, 3}, eval('sort([3, 2, 1])'))
    eq({13, 28, 3}, eval('sort([3, 28, 13])'))
  end)

  it('numbers compared as numeric', function()
    eq({1, 2, 3}, eval("sort([3, 2, 1], 'n')"))
    eq({3, 13, 28}, eval("sort([3, 28, 13], 'n')"))
    -- Strings are not sorted.
    eq({'13', '28', '3'}, eval("sort(['13', '28', '3'], 'n')"))
  end)

  it('numbers compared as numbers', function()
    eq({3, 13, 28}, eval("sort([13, 28, 3], 'N')"))
    eq({'3', '13', '28'}, eval("sort(['13', '28', '3'], 'N')"))
  end)

  it('numbers compared as float', function()
    eq({0.28, 3, 13.5}, eval("sort([13.5, 0.28, 3], 'f')"))
  end)
end)
