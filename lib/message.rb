class Message

  def initialize(message)
    @message = message
  end

  def voice_text
    voicetext = Voicetext.new(Settings.voice_text_api_key)
    wav = voicetext.tts(@message, 'show')
    attached_file = AttachedFile.new(name: "#{SecureRandom.hex(5)}.wav", data: wav)
    attached_file.save
    attached_file.id
  end
end