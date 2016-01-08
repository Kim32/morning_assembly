class Message < ActiveRecord::Base
  before_save :voice_text
  validates_uniqueness_of :division_cd
  belongs_to :attached_file

  def voice_text
    voicetext = Voicetext.new(Settings.voice_text_api_key)
    wav = voicetext.tts(self.content, 'show')
    attached_file = AttachedFile.new(name: "#{SecureRandom.hex(5)}.wav", data: wav)
    attached_file.save
    attached_file.id
  end
end
