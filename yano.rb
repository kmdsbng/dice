class Dice
  attr_accessor :top, :west, :south
  def initialize
    @top = 1
    @west = 3
    @south = 5
  end

  def bottom
    7 - @top
  end

  def east
    7 - @west
  end

  def north
    7 - @south
  end

  def roll(token)
    tmp = self.clone
    case token
    when "N"
      @top = tmp.south
      @south = tmp.bottom
    when "S"
      @top = tmp.north
      @south = tmp.top
    when "W"
      @top = tmp.east
      @west = tmp.top
    when "E"
      @top = tmp.west
      @west = tmp.bottom
    end
    @top
  end

  def self.exec(tokens)
    dice = self.new
    " #{tokens}".split(//).map do |token|
      dice.roll(token)
    end.join
  end
end

test_data = [["0","NNESWWS","15635624"],
             ["1","EEEE","13641"],
             ["2","WWWW","14631"],
             ["3","SSSS","12651"],
             ["4","NNNN","15621"],
             ["5","EENN","13651"],
             ["6","WWNN","14651"],
             ["7","SSNN","12621"],
             ["8","NENNN","153641"],
             ["9","NWNNN","154631"],
             ["10","SWWWSNEEEN","12453635421"],
             ["11","SENWSWSNSWE","123123656545"],
             ["12","SSSWNNNE","126546315"],
             ["13","SWNWSSSWWE","12415423646"],
             ["14","ENNWWS","1354135"],
             ["15","ESWNNW","1321365"],
             ["16","NWSSE","154135"],
             ["17","SWNWEWSEEN","12415154135"],
             ["18","EWNWEEEEWN","13154532426"],
             ["19","WNEWEWWWSNW","145151562421"],
             ["20","NNEE","15631"],
             ["21","EEEEWNWSW","1364145642"],
             ["22","SENNWWES","123142321"],
             ["23","SWWWSNSNESWW","1245363635631"],
             ["24","WESSENSE","141263231"],
             ["25","SWNSSESESSS","124146231562"],
             ["26","ENS","1353"],
             ["27","WNN","1453"],
             ["28","SSEENEEEN","1263124536"],
             ["29","NWSNNNW","15414632"],
             ["30","ESSSSSWW","132453215"],
             ["31","ESE","1326"],
             ["32","SNWNWWNSSSS","121456232453"],
             ["33","SWEESEN","12423653"],
             ["34","NEEWNSSWWW","15323631562"],
             ["35","WSEW","14212"],
             ["36","SWSNNNSNWE","12464131353"],
             ["37","ENWEWSEEW","1351513545"],
             ["38","WSEWN","142124"],
             ["39","EWNEESEWE","1315321414"],
             ["40","NESEEN","1531263"],
             ["41","WSW","1426"],
             ["42","ENEWE","135656"]]

count = 0
test_data.each do |test|
  if Dice.exec(test[1]) == test[2]
    puts "#{test[0]} success"
    count += 1
  else
    puts "#{test[0]} failure"
  end
end

puts "result: #{count}/#{test_data.length}"


