# Лабораторная работа №3 по дисциплине "Функциональная схемотехника"
Выполнил: студент группы P33113 Лукьяненко Н.И.

Преподаватель: Тищук Б.Ю. 

Санкт-Петербург, 2021

## Вариант 8
y = a * cbrt(b)

## Принцип работы
Последовательно вычисляется значение y: сначала cbrt(b), затем mult(a, cbrt(b)). То есть выход cbrt подается на второй вход mult.

## Скриншоты выполнения
### Временная диаграмма
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab3/img/time_diagram.png)

### Тесты
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab3/img/console.png)

### Ресурсы FPGA
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab3/img/fpga_resources.png)
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab3/img/power.png)

### Схема
![](https://github.com/BeeRHaZaRD/Circuit-Design/blob/main/lab3/img/shceme.png)
