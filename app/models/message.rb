class Message < ActiveRecord::Base
  before_save :voice_text
  validates_uniqueness_of :division_cd
  as_enum :division, post: 1, pre: 2
  belongs_to :attached_file

  def sound
    self.attached_file.present? ? self.attached_file.name : nil
  end

  def voice_text
    return if self.content.blank?
    voicetext = Voicetext.new(Settings.voice_text_api_key)
    wav = voicetext.tts(self.content, 'show')
    self.attached_file = AttachedFile.new(name: "#{SecureRandom.hex(5)}.wav", data: wav)
  end
end
