#!/usr/bin/env ruby
# calculator.rb
# Простой интерактивный калькулятор на Ruby
# Поддерживает операции: +, -, *, /

def prompt(msg)
  print msg
  gets.chomp
end

def to_number(str)
  # Попытка преобразовать в целое, если нет — в float
  return Integer(str) rescue Float(str) rescue nil
end

def read_number(msg)
  loop do
    input = prompt(msg)
    num = to_number(input)
    return num if num != nil
    puts "Неверный ввод. Введите число (например: 12, 3.14 или -5):"
  end
end

def read_operator
  loop do
    op = prompt("Введите оператор (+, -, *, /): ")
    return op if ['+','-','*','/'].include?(op)
    puts "Неверный оператор. Допускаются: +, -, *, /"
  end
end

def calculate(a, op, b)
  case op
  when '+' then a + b
  when '-' then a - b
  when '*' then a * b
  when '/'
    if b == 0
      "Ошибка: деление на ноль!"
    else
      a.to_f / b
    end
  else
    "Неизвестный оператор"
  end
end

def calculator
  puts "=== Простой калькулятор на Ruby ==="
  loop do
    a = read_number("Введите первое число: ")
    op = read_operator
    b = read_number("Введите второе число: ")

    result = calculate(a, op, b)
    puts "Результат: #{result}"

    continue = prompt("Хотите ещё вычислить? (y/n): ").downcase
    break unless continue == 'y'
  end
  puts "Спасибо за использование калькулятора. Пока!"
end

calculator
