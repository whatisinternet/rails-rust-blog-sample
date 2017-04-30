require 'fiddle'

library = Fiddle::dlopen('target/release/librust_blog.dylib')

Fiddle::Function.new(library['initialize_my_app'], [], Fiddle::TYPE_VOIDP).call
