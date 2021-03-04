# Лабораторная работа №1 по дисциплине "Функциональная схемотехника"
Выполнил: студент группы P33113 Лукьяненко Н.И.

Преподаватель: Тищук Б.Ю. 

Санкт-Петербург, 2021

## Задание
1. Опишите на Verilog HDL на вентильном уровне модуль, реализующий функцию БОЭ в указанном логическом базисе согласно варианту задания.
2. Разработайте тестовое окружение для созданного модуля.
3. Проведите моделирование работы схемы.

## Вариант 8
Шифратор кода Грея для трехразрядного двоичного числа

## Схема
![Schema](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/schema.png)

Таблица истинности:
x1 | x2 | x3 | x4 | x5 | x6 | x7 | x8 | y3 | y2 | y1
---|----|----|----|----|----|----|----|----|----|----
1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0
0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1
0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1
0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0
0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 1 | 0
0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 1
0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 1
0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0

```
y1 = x2 ⋁ x3 ⋁ x6 ⋁ x7
y2 = x3 ⋁ x4 ⋁ x5 ⋁ x6
y3 = x5 ⋁ x6 ⋁ x7 ⋁ x8
```

### Результаты моделирования
```
Input: 0x1 Output: y3=0, y2=0, y1=0
The encoder output for x1 = 1 is correct!
Input: 0x2 Output: y3=0, y2=0, y1=1
The encoder output for x2 = 1 is correct!
Input: 0x4 Output: y3=0, y2=1, y1=1
The encoder output for x3 = 1 is correct!
Input: 0x8 Output: y3=0, y2=1, y1=0
The encoder output for x4 = 1 is correct!
Input: 0x10 Output: y3=1, y2=1, y1=0
The encoder output for x5 = 1 is correct!
Input: 0x20 Output: y3=1, y2=1, y1=1
The encoder output for x6 = 1 is correct!
Input: 0x40 Output: y3=1, y2=0, y1=1
The encoder output for x7 = 1 is correct!
Input: 0x80 Output: y3=1, y2=0, y1=0
The encoder output for x8 = 1 is correct!
```

## Временная диаграмма
![Time diagram](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/diagram.png)

## Потребление ресурсов на FPGA
![Resource load fpga](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/resource-load.png)

## Вывод
В ходе выполнения лабораторной работы была синтезирована комбинационная схема шифратора кода Грея для трехразрядных двоичных чисел и описана на языке Verilog HDL. Я познакомился с основами работы в среде Vivaldo и возможностями языка Verilog для моделирования и тестирования комбинационных схем.
