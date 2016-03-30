class ApplicationDecorator
  attr_reader :o

  def initialize(object, view_context)
    @o = object
    @view_context = view_context
  end

  def self.decorate_collection(collection, view_context)
    return nil if collection.nil?

    decorated_collection = collection.map{ |item| self.new(item, view_context) }
    if collection.respond_to?(:total_count)
      Kaminari.paginate_array(decorated_collection, total_count: collection.total_count).page(collection.current_page)
    else
      decorated_collection
    end
  end

  # Required for russian doll caching
  def cache_key
    @o.cache_key
  end

  def inspect
    o.inspect
  end

  def nil?
    o.nil?
  end

  def present?
    o && o.present?
  end

  def ==(other)
    o==other
  end

  def as_json
    o.as_json
  end

  private

  def h
    @view_context
  end

end
