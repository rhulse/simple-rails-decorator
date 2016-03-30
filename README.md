# Simple Rails Decorator

This code is an extraction of the simple decorator I use in the Rails app that powers radionz.co.nz

The aim was to be as thin and performant as possible.

For that reason I did not use method_missing, or any other magic to determine the view_context.

The decorators expose only those methods that are actually needed from the model via the OBJECT_PASS_THROUGH_METHODS at the top of the object.

You can also create your own methods that call the underlying model object, and do whatever you want in them.

To use this decorator pattern create a folder in your Rails project:

```
  app/decorators
```

and copy the application_decorator.rb into it.

The thing_deocorator.rb is an example file

Into the application.rb add

```
  config.autoload_paths << #{config.root}/app/decorators
```

To call the decorator in a controller:

```
  @thing = ThingDecorator.new(@thing, view_context)
```

Or in a view (if you really must), or a helper:

```
  @thing = ThingDecorator.new(@thing, self)
```

I've found the discipline of having to add the pass-through methods at the top of the decorator to be quite useful. Why am I calling this method direct? What is it being used for?

Likewise, code that I write in the decorator. Is the used by more than one decorator (move it into application decorator), or are there methods that might be better grouped in an intermediate decorator class. 

For example, audio and news objects in my app both share code from story_decorator, which is based off application_decorator.

This ensures maximum sharing of code, while minimising the number of methods exposed in the view.

For testing I use rspec. Add a decorators folders inside spec.

Add this to your rspec config to tell it the decorator path and that it is a view

```
  RSpec.configure do |config|
    config.include ActionView::TestCase::Behavior, file_path: %r{spec/decorators} 
  end
```

I welcome any feedback or suggestions. 
