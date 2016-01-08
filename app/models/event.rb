class Event < ActiveRecord::Base
  # before_save :voice_text
  #
  # validates :name, :presence => true
  #
  # belongs_to :attached_file
  # attr_writer :sound
  # has_many :staff
  #
  # def sound
  #   self.attached_file.present? ? self.attached_file.name : nil
  # end
  #
  # def voice_text
  #   return if self.furigana.blank?
  #   #voicetext = Voicetext.new(Settings.voice_text_api_key)
  #   voicetext = Voicetext.new("czxt2o2n5qoohtyw")
  #   wav = voicetext.tts(self.furigana, 'show')
  #   self.attached_file = AttachedFile.new(name: "#{SecureRandom.hex(5)}.wav", data: wav)
  # end
end
