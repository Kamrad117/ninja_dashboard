json.array!(@vcenters) do |vcenter|
  json.extract! vcenter, :id, :url
  json.url vcenter_url(vcenter, format: :json)
end
