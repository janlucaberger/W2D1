class Employee

  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end


class Manager < Employee
attr_accessor :underlings
  def initialize(name, title, salary, boss)
    @underlings = []
    super
  end

  def add_underlings(*name)
    name.each do |underling|
      @underlings << underling
    end
  end

  def bonus(multiplier)
    self.flatten_salary * multiplier
  end

  def flatten_salary
    salaries = 0
    @underlings.each do |underling|
      salaries += underling.salary
      if underling.is_a?(Manager)
        salaries += underling.flatten_salary
      end
    end
    salaries
  end

end

if __FILE__ == $PROGRAM_NAME
  load 'inheritance.rb'
  ned = Manager.new('Ned', 'founder', 1000000, nil)
  darren = Manager.new('Darren', "TA Manager", 78000, ned)
  ned.add_underlings(darren)
  shawna = Employee.new('Shawna', "TA", 12000, darren)
  david = Employee.new('David', "TA", 10000, darren)
  darren.add_underlings(shawna, david)

end
