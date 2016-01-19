namespace :morning_assembly do
  desc 'ラジオ体操、朝礼当番を流す'
  task :run => :environment do
    MorningAssembly.run(Date.today)
  end
end
