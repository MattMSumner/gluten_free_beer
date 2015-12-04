class BeerResource < JSONAPI::Resource
  immutable

  attributes :abv,
    :description,
    :name,
    :name_display,
    :style_description,
    :style_name,
    :style_short_name,
    :is_organic
end
