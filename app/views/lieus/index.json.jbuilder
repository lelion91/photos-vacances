json.array!(@lieus) do |lieu|
  json.extract! lieu, :id, :nom, :commentaire, :recommandation
  json.url lieu_url(lieu, format: :json)
end
