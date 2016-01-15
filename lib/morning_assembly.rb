class MorningAssembly
  def self.run(today)
    self.new(today).main
  end

  def initialize(today)
    @target_date = today
  end

  def main
    exercises
    duty
  end

  private
  def exercises
    path = 'taisou/radio_taisou.mp3'
    system("afplay #{path}")
  end

  def duty
    dutys = Event.where("start >= ? and start < ?", @target_date, @target_date + 1)
    dutys.each do |duty|
      speak(duty.title)
    end
  end

  def speak(duty_name)
    return if duty_name.blank?
    path = 'voice/'+ duty_name + '.wav'
    system("afplay #{path}")
  end
end