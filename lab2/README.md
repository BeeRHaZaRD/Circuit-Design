# Лабораторная работа №2 по дисциплине "Функциональная схемотехника"
Выполнил: студент группы P33113 Лукьяненко Н.И.

Преподаватель: Тищук Б.Ю. 

Санкт-Петербург, 2021

## Вариант 8
y = a * cbrt(b)

## Принцип работы
Последовательно вычисляется значение y: сначала cbrt(b), затем mult(a, cbrt(b)). То есть выход cbrt подается на второй вход mult.

## Скриншоты выполнения
### Временная диаграмма
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab2/img/time_diagram.png)

### Тесты
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab2/img/console.png)

### Ресурсы FPGA
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab2/img/fpga_resources.png)

### Схема
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab2/img/shceme.png)

## Вывод
В ходе выполнения работы была создана последовательностная схема ускорителя математических вычислений.
