# Передаем в интерффейс объект "стратегии"
# CashPay, CardPay - стратегии, которые передаем
class CashPay
  def pay
    puts "Pay Cash"
  end
end

class CardPay
  def pay
    puts "Pay Card"
  end
end

class Interface
  def initialize(strategy)
    @strategy = strategy
  end

  def pay
    @strategy.pay
  end
end

strategy = CashPay.new
payment = Interface.new(strategy)
payment.pay