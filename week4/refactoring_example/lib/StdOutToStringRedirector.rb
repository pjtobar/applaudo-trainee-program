module StdOutToStringRedirector
  require 'stringio'
  def self.redirect_stdout_to_string
    sio = StringIO.new
    old_stdout = $stdout
    $stdout = sio
    yield
    $stdout = old_stdout
    sio.string
  end
end
