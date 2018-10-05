# MIXINS and Composition

# Imagine you have a module `Silly` that you are mixing into class `Face`

module Silly
  def go_silly
    @expression = ';-)~'
  end
end

class Face
  include Silly             # include Silly module's methods

  attr_reader :expression   # meta-programming to create `expression` method

  def initialize
    @expression = ':-|'
  end

  def smile
    @expression = ':-)'
  end
end

# You’ll see that the `#go_silly` method in the `Silly` module accesses `@expression`
# as if it is local!  How does it work?

# Well, the `include` statement in class `Face` basically copy-pastes the
# contents of `Silly` into its own body

class Face
  # created by mixin
  def go_silly
    @expression = ';-)~'
  end

  # created by meta-programming
  def face
    @face
  end

  def initialize
    @expression = ':-|'
  end

  def smile
    @expression = ':-)'
  end
end

# So now you can see that the `#go_silly` method is just pasted into
# class `Face` so it can access `@expression` locally.

# I’ve also shown that `attr_reader` is just a meta-programming function
# call that creates `def face...` method for you.
