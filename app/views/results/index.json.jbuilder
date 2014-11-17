json.array!(@results) do |result|
  json.extract! result, :id, :busnum, :nextstop
  json.url result_url(result, format: :json)
end
