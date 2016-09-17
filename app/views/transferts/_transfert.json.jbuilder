
json.extract! transfert, :id, :code, :value, :origin, :destination, :name
# json.extract! transfert, :id, :code_koatuu, :code, :name, :coord_x, :coord_y, :baz_dot, :rev_dot
json.url transfert_url(transfert, format: :json)