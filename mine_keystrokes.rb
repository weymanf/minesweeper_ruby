# encoding: utf-8

require 'yaml'
require './minesweeper'
require 'dispel'

if __FILE__ == $PROGRAM_NAME
  def draw(mine)
    [mine.display, status_line(mine), "q=Quit f=flag enter=reveal"].join("\n")
  end

  def status_line(miness)
  if miness.won?
    "Player has won!!!!"
  
  else
    
  end
end

  Dispel::Screen.open do |screen|
  miness = Minesweeper.new
  draw(miness)

  Dispel::Keyboard.output do |key|
    case key
    when :up then miness.move(0,-0.5)
    when :down then miness.move(0,0.5)
    when :right then miness.move(0.5,0)
    when :left then miness.move(-0.5,0)
    when "f" then miness.flag(miness.pos)
    when :enter then miness.expand(miness.pos) # enter
    when "q" then break
    end
    draw(miness)
  end
end
end
