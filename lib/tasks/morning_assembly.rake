namespace :morning_assembly do
  require ENV['PWD'] + "/lib/morning_assembly"
  desc 'ラジオ体操、朝礼当番を流す'
  task :run => :environment do
    MorningAssembly.run(Date.today)
  end
end
