class ConsoleLogger < Logger
  def initialize(silencer: true)
    @silencer=silencer
    super(STDOUT)
    self.formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}] #{msg}\n"
    end
  end

  def silence(temporary_level = Logger::ERROR)
    if @silencer
      begin
        old_logger_level, self.level = level, temporary_level
        yield self
      ensure
        self.level = old_logger_level
      end
    else
      yield self
    end
  end
end
