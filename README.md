# Лабораторная работа №1 по дисциплине "Функциональная схемотехника"

## Задание

## Схема

```
y1 = x2 ⋁ x3 ⋁ x6 ⋁ x7
y2 = x3 ⋁ x4 ⋁ x5 ⋁ x6
y3 = x5 ⋁ x6 ⋁ x7 ⋁ x8
```

### 
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


## Вывод
