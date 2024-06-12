class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
    @total_coast = 0
  end

  def add_participant(name, money_paid)
    @participants[name] = money_paid
    @total_coast += money_paid
  end

  def split
    total_cost / @participants.count
  end

  def owed
    result = {}
    @participants.each do |k,v|
      result[k] = -(v - split)
    end
    result
  end
end
