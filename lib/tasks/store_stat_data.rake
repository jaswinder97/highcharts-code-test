task :fetch_and_store_stat_data => :environment do |t, args|
  options = [ "hour", "day", "week", "month", "quarter", "year" ]
  app_openid_client_id = args[:openid_client_id] || '825db136-ce87-444c-8b7c-89f6b49a00eb'
  app = App.find_by(openid_client_id: app_openid_client_id) || App.first
  user = args[:user] || 'notrehtad'
  pass = args[:pass] || 'K3GcbhDsq/vgNUo'
  options.each do |option|    # loop for all options for each app
    url = "https://srv.qryp.to/api/logsummary/#{app_openid_client_id}/#{option}"
    response = HTTParty.get(url, { headers: { authorization: 'Basic bm90cmVodGFkOkszR2NiaERzcS92Z05Vbw==', user: user, pass: pass } })
    records = JSON.parse(response.body)
    records.each do |data|
      Stat.create!(client_id: data["client_id"],period_starting: data["period_starting"], operation_type: data["operation_type"], operation: data["operation"], 
                   start_result: data["start_result"],finish_result: data["finish_result"], operations_started: data["operations_started"], operations_finished: data["operations_finished"], 
                   distinct_identities: data["distinct_identities"], total_elapsed_time: data["total_elapsed_time"], average_elapsed_time: data["average_elapsed_time"], option_type: option, app_id: app.id)
    end
  end
end
