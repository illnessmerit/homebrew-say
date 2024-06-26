# frozen_string_literal: true

cask 'say' do
  version '0.8.3'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '0808f605f93d75c798c3312bab702c1946cb83f8c1d4a73f08b1e29c5b995cbc'
  depends_on formula: 'ffmpeg'
  depends_on cask: 'visual-studio-code'
  app 'say.app'
  # Workaround for the error: "say.app is damaged and can't be opened. You should move it to the Trash."
  # This error occurs when opening the app.
  # The following command clears the extended attributes of the file, resolving the issue.
  postflight do
    system 'xattr', '-c', "#{appdir}/say.app"
  end
end
