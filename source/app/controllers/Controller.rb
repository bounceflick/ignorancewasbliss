class Controller
  # def initialize(input)
  #   @command, @subcommand = ARGV[0].split(":")
  #   @view = View.new
  # end

  def self.run!(arguments, view)
    @command1, @command2  = arguments
    @view = view.new

    return @view.console("Specify a command, please!!\n") if !@command1

    if (self.respond_to?(@command1))
      self.send(@command1, @command2)
    else
      raise "Command doesn't exist"
    end
  end

  def self.list(*subcommand)
    @view.console("about to list all items\n")
  end

  def self.help(_)
    help_message = %{Ignorance Was Bliss - What you never wanted to know about where you eat...
        - list top 10 (list top 10 restaurants by rating)
        - list bottom 10 (list bottom 10 restuarants by rating)
        ----------UNIMPLEMENTED---------------------------------
        - XX
        - XX
        - XX\n}

      @view.help(help_message)
  end

end
