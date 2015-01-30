require_relative '../views/view.rb'
require_relative '../models/list.rb'
require_relative '../models/task.rb'


class Controller
  # def initialize(input)
  #   @command, @subcommand = ARGV[0].split(":")
  #   @view = View.new
  # end

  def self.run!(arguments, view)
    @command, @subcommand = arguments[0].split(":")
    @view = view.new

    if self.respond_to?(@command)
      self.send(@command, @subcommand)
    else
      raise "Command doesn't exist"
    end
  end

  def self.list(*subcommand)
    @view.console("about to list all items\n")
    # List a specific task, or tags

    case subcommand[0]
    when "outstanding"
      if ARGV[1]
        index = ARGV[1].to_i - 1
        taskz = List.all[index].tasks.where(completed:false)
        message = ""
        taskz.each { |task| message << task.to_string << "\n"}
        # puts message
        #puts taskz
        @view.console(message)
      else
        @view.console("You didn't specify the list!")
      end
    when "completed"
      if ARGV[1]
        index = ARGV[1].to_i - 1
        taskz = List.all[index].tasks.where(completed:true)
        message = ""
        taskz.each { |task| message << task.to_string << "\n"}
        # puts message
        #puts taskz
        @view.console(message)
      else
        @view.console("You didn't specify the list!")
      end
    else
      if ARGV[1].to_i > 0
        index = ARGV[1].to_i - 1
        list = List.all[index]
        @view.console(list.to_string)
      else
        @view.console("Wrong list arguments")
      end
    end
  end

  def self.tag(subcommand)
    #args = subcommand.split(":")
    tag = Tag.create(name: ARGV[2])
    tags_task = TagsTask.create(tag_id: tag.id, task_id: ARGV[1])
  end

  def self.filter(subcommand)
    # only works for one task...
    tasks = Task.where(id: TagsTask.where(tag_id: Tag.all.where(name: subcommand).first.id).first.task_id)
    message = ""
    tasks.each { |task| message << task.to_string << "\n"}
    @view.console(message)
  end

  def self.add(subcommand)
    @view.console('about to add ' + subcommand)
    new_task = Task.new(subcommand, 1)
    new_task.save
  end

  def self.delete(subcommand)
    #@view.console('about to delete ' + subcommand)
    item_number = ARGV[1].to_i
    List.all.first.tasks[item_number-1].destroy
  end

  def self.complete(subcommand)
    item_number = ARGV[1].to_i
    #@view.console('about to complete ' + subcommand)
    List.all.first.tasks[item_number-1].update(completed: true)
  end

  def self.help(_)
    help_message =
    %{- list (all lists)
      - list <<list number>: <item number>> (list number)
      - filter:<tag>
      - tag:<tag>
      - delete <<list number>: <item number>>
      - add <list number> message}
    @view.help(help_message)
  end

end
